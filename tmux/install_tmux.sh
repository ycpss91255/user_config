#!/usr/bin/env bash

sudo apt update \
    && sudo apt install -y --no-install-recommends \
        git \
        tmux \
    && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
    && cp ./tmux.conf ~/.tmux.conf \
    && cp ./tmux_status.sh ~/.tmux_status.sh \
    && chmod +x ~/.tmux_status.sh \
    && ~/.tmux/plugins/tpm/scripts/install_plugins.sh
