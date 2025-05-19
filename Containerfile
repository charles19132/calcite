FROM scratch
RUN mkdir -m 0700 -p /var/roothome
RUN dnf install @workstation -y
RUN dnf remove console-login-helper-messages{,profile} -y
RUN echo 'KERNEL=="loop0", ENV{UDISKS_IGNORE}="1"' | tee /etc/udev/rules.d/10-bootc.rules
RUN systemctl set-default graphical.target
