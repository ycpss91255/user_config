#!/usr/bin/env bash

# ${1}: USER NAME

username=${1:-"$USER"}

sudo apt update \
    && sudo apt install -y --no-install-recommends \
        git \
        vim \
    && curl -fLo /home/"${username}"/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && cp vimrc /home/"${username}"/.vimrc \
    && vim -es -u /home/"${username}"/.vimrc -i NONE -c "PlugInstall" -c "qa"
