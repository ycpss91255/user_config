#!/usr/bin/env bash

installed_nvidia_drivers=$(dpkg --get-selections | grep -oP '^nvidia-driver-\d+' | head -1)

if [ -n "${installed_nvidia_drivers}" ]; then
    sudo apt purge -y \
        "${installed_nvidia_drivers}" \
    && sudo add-apt-repository --remove ppa:graphics-drivers/ppa \
    && sudo apt purge ubuntu-drivers-common -y \
    && sudo apt update
fi
