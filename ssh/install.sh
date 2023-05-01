#!/usr/bin/env bash

# ${1}: USER NAME

# file_dir=$(dirname "$(readlink -f "${0}")")
# username=${1:-"$USER"}

sudo apt update && \
sudo apt install -y --no-install-recommends \
    ssh \
    openssh-server \
    openssh-client \
    sshfs && \
sudo systemctl enable ssh && \
sudo sed -i 's/#\s*\(ForwardX11 yes\)/\1/' /etc/ssh/ssh_config && \
sudo sed -i -e 's/#\s*\(AllowTcpForwarding yes\)/\1/' \
           -e 's/#\s*\(X11Forwarding yes\)/\1/' \
           -e 's/#\s*\(X11DisplayOffset 10\)/\1/' \
           -e 's/#\s*\(X11UseLocalhost yes\)/\1/' \
           /etc/ssh/sshd_config && \
sudo systemctl restart ssh
# sudo systemctl status ssh
