#!/usr/bin/env bash

installed_nvidia_drivers=$(dpkg --get-selections | grep -oP '^nvidia-driver-\d+' | head -1)

if [ -z "${installed_nvidia_drivers}" ]; then
    sudo apt update \
    && sudo apt install -y --no-install-recommends \
        software-properties-common \
        ubuntu-drivers-common \
        gnupg-agent \
    && sudo add-apt-repository -y ppa:graphics-drivers/ppa

    # BUG: docker not work, wait test to normal system
    recommended_drivers=$(ubuntu-drivers devices | grep 'recommended' | awk '{print $3}')

    if [ -n "${recommended_drivers}" ]; then
        sudo apt update \
        && sudo apt install -y --no-install-recommends \
            "${recommended_drivers}" \
        && echo "Recommended drivers: ${recommended_drivers}" \
        && nvidia-smi
    else
        echo "No recommended drivers found"
        exit 1
    fi
else
    echo "Nvidia drivers already installed: ${installed_nvidia_drivers}"
fi
