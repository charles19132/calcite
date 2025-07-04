FROM ghcr.io/charles25565/unified-bootc-images:r10
RUN dnf group install workstation-product-environment -y --allowerasing -x rootfiles && \
    (dnf install fedora-release-ostree-desktop -y || true) && \
    dnf remove console-login-helper-messages{,-profile} PackageKit{,-command-not-found} -y && \
    dnf clean all && \
    sed -i 's@--apply@@g' /usr/lib/systemd/system/bootc-fetch-apply-updates.service && \
    systemctl set-default graphical.target
