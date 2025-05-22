FROM ghcr.io/charles25565/unified-bootc-images:c10s
RUN dnf group install workstation-product-environment -y --allowerasing -x rootfiles && \
    dnf remove console-login-helper-messages{,profile} -y && \
    dnf clean all && \
    systemctl set-default graphical.target