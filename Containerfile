FROM quay.io/centos-bootc/centos-bootc:stream10
RUN grep -q "cpe:/o:centos:centos:10" /etc/os-release && (rm -rf /etc/yum.repos.d/* && curl -o /etc/yum.repos.d/cs.repo "https://gitlab.com/redhat/centos-stream/containers/bootc/-/raw/c10s/cs.repo?ref_type=heads") || true
RUN dnf group install workstation-product-environment -y --allowerasing -x rootfiles && \
    (dnf install fedora-release-ostree-desktop -y || true) && \
    dnf remove console-login-helper-messages{,-profile} PackageKit{,-command-not-found} -y && \
    dnf clean all && \
    sed -i 's@--apply@@g' /usr/lib/systemd/system/bootc-fetch-apply-updates.service && \
    systemctl set-default graphical.target
