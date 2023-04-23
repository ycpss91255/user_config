#!/usr/bin/env bash

sudo apt remove -y --purge \
    docker \
    docker-engine \
    docker.io \
    containerd \
    runc \
&& sudo apt autoremove -y --purge \
&& sudo apt update \
&& sudo apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
&& sudo mkdir -m 0755 -p /etc/apt/keyrings \
&& curl -fsSL https://download.docker.com/linux/ubuntu/gpd \
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
&& sudo systemctl enable containerd.service


    && sudo apt install -y --no-install-recommends \
