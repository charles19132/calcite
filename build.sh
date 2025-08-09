#!/bin/bash
set -euxo pipefail

# Fix for CentOS bootc images
for release in 9 10; do
  grep -q "cpe:/o:centos:centos:${release}" /etc/os-release && \
    (echo "Detected CentOS Stream release ${release}. Replacing the repos with the ones used at image build time." 1>&2
    rm -rf /etc/yum.repos.d/*
    curl -o /etc/yum.repos.d/cs.repo \
    "https://gitlab.com/redhat/centos-stream/containers/bootc/-/raw/c${release}s/cs.repo?ref_type=heads") \
    || true
done

dnf group install workstation-product-environment -y --allowerasing -x rootfiles
# Fix for Fedora
grep -q "ID=fedora" /etc/os-release && \
  (echo "Detected Fedora. Installing fedora-release-ostree-desktop." 1>&2
  dnf install fedora-release-ostree-desktop -y) \
  || true
dnf remove console-login-helper-messages{,-profile} PackageKit{,-command-not-found} -y
dnf clean all

sed -i 's@--apply@@g' /usr/lib/systemd/system/bootc-fetch-apply-updates.service
systemctl set-default graphical.target
