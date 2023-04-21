#!/usr/bin/env bash

sudo apt remove -y --purge \
    tmux \
    && rm -rf ~/.tmux \
    && rm -f ~/.tmux.conf \
    && rm -f ~/.tmux_status.sh
