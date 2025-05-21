FROM ghcr.io/charles25565/unified-bootc-images:c10s
RUN mkdir -m 0700 -p /var/roothome && \
    dnf install @workstation -y && \
    dnf remove console-login-helper-messages{,profile} -y && \
    dnf clean all && \
    echo 'KERNEL=="loop0", ENV{UDISKS_IGNORE}="1"' | tee /etc/udev/rules.d/10-bootc.rules && \
    systemctl set-default graphical.target