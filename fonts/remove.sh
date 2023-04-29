#!/usr/bin/env bash

# ${1}: USER NAME

username=${1:-"$USER"}

sudo rm -r "/home/${username}/.local/share/fonts/FiraCode" && \
sudo rm -r "/home/${username}/.local/share/fonts/MesloLGS NF" && \
sudo rm -r "/home/${username}/.local/share/fonts/SourceCodePro" && \
sudo fc-cache -f
