#!/usr/bin/env bash

# ${1}: USER NAME

username=${1:-"$USER"}

sudo apt purge -y \
    tmux \
    && rm -rf /home/"${username}"/.tmux \
    && rm -f /home/"${username}"/.tmux.conf

    # && rm -rf ~/.tmux/plugins/tpm \
