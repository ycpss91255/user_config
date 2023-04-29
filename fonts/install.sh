#!/usr/bin/env bash

# ${1}: USER NAME

file_dir=$(dirname "$(readlink -f "${0}")")
username=${1:-"$USER"}

sudo apt update && \
sudo apt install -y --no-install-recommends \
    fontconfig && \
cp -r "${file_dir}/fonts" "/home/${username}/.local/share/" && \
sudo fc-cache -f
