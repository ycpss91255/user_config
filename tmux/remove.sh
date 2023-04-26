#!/usr/bin/env bash

sudo apt purge -y \
    tmux \
    && rm -rf ~/.tmux \
    && rm -f ~/.tmux.conf \
    && rm -f ~/.tmux_status.sh

    # && rm -rf ~/.tmux/plugins/tpm \
