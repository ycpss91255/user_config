#!/usr/bin/env bash

#${1}: USER NAME

username=${1:-"$USER"}

vim -es -u /home/"${username}"/.vimrc -i NONE -c "PlugClean" -c "qa" \
&& sudo apt purge -y \
    vim \
&& rm -rf /home/"${username}"/.vim \
&& rm -rf /home/"${username}"/.vimrc
