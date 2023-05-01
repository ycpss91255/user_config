#!/usr/bin/env bash

# ${1}: USER NAME

username=${1:-"$USER"}
file_dir=$(dirname "$(readlink -f "${0}")")

sudo apt update && \
sudo apt install -y --no-install-recommends \
    git \
    curl \
    vim && \
curl -fLo /home/"${username}"/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
cp "${file_dir}"/vimrc /home/"${username}"/.vimrc && \
vim -es -u /home/"${username}"/.vimrc -i NONE -c "PlugInstall" -c "qa"
