#!/usr/bin/env bash

sudo apt purge -y --purge \
    docker \
    docker-engine \
    docker.io \
    containerd \
    runc

# BUG: if meybe error and docker.list ??
sudo apt update \
&& sudo apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    pciutils \
    kmod \
&& sudo install -m 0755 -d /etc/apt/keyrings \
&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
&& echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& sudo chmod a+r /etc/apt/keyrings/docker.gpg \
&& sudo apt update \
&& sudo apt install -y --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin \
&& sudo groupadd docker \
&& sudo usermod -aG docker ${USER} \
&& newgrp docker \
&& sudo chown "${USER}":"${USER}" /home/"${USER}"/.docker -R \
&& sudo chmod g+rwx "/home/"${USER}"/.docker" -R \
&& sudo systemctl enable docker.service \
&& sudo systemctl enable containerd.service \
&& if (lspci | grep -q VGA ||
    lspci | grep -iq NVIDIA ||
    lsmod | grep -q nvidia ||
    nvidia-smi -L >/dev/null 2>&1 | grep -iq nvidia) &&
    (command -v nvidia-smi >/dev/null 2>&1); then
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
        && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
            | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
        && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list \
            | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
            | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
    && sudo apt update \
    && sudo apt install -y --no-install-recommends \
        nvidia-container-toolkit \
    && sudo systemctl restart docker
fi
