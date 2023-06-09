#!/usr/bin/env bash

# ${1}: USER NAME

file_dir=$(dirname "$(readlink -f "${0}")")
username=${1:-"$USER"}

sudo apt update && \
sudo apt install -y --no-install-recommends \
    git \
    tmux && \
rm -rf /home/"${username}"/.tmux/plugins/tpm >/dev/null 2>&1 && \
git clone --depth 1 https://github.com/tmux-plugins/tpm /home/"${username}"/.tmux/plugins/tpm && \
cp "${file_dir}"/tmux.conf /home/"${username}"/.tmux.conf && \
/home/"${username}"/.tmux/plugins/tpm/scripts/install_plugins.sh
