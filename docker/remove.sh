#!/usr/bin/env bash

if (lspci | grep -q VGA ||
    lspci | grep -iq NVIDIA ||
    lsmod | grep -q nvidia ||
    nvidia-smi -L >/dev/null 2>&1 | grep -iq nvidia) &&
    (command -v nvidia-smi >/dev/null 2>&1); then
    sudo apt remove -y --purge \
        nvidia-container-toolkit && \
    sudo rm /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg && \
    sudo rm /etc/apt/sources.list.d/nvidia-container-toolkit.list
fi

sudo apt purge -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin && \
sudo rm /etc/apt/keyings/docker.gpg && \
sudo rm /etc/apt/sources.list.d/docker.list && \
sudo groupdel docker && \
sudo gpasswd -d "${USER}" docker && \
sudo rm -rf /home/"${USER}"/.docker && \
sudo systemctl disable docker.service && \
sudo systemctl disable containerd.service
