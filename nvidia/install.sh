#!/usr/bin/env bash

installed_nvidia_drivers=$(dpkg --get-selections | grep -oP '^nvidia-driver-\d+' | head -1)

if [ -z "${installed_nvidia_drivers}" ]; then
    sudo add-apt-repository -y ppa:graphics-drivers/ppa \
    && sudo apt install -y --no-install-recommends \
        ubuntu-drivers-common \
    && recommended_drivers=$(ubuntu-drivers devices | grep 'recommended' | awk '{print $3}') \
    && sudo apt update \
    && sudo apt install -y --no-install-recommends \
        "${recommended_drivers}" \
    && nvidia-smi
else
    echo "Nvidia drivers already installed: ${installed_nvidia_drivers}"
fi
