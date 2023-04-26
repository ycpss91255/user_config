#!/usr/bin/env bash

vim -es -u ~/.vimrc -i NONE -c "PlugClean" -c "qa" \
&& sudo apt purge -y \
    vim \
&& rm -rf ~/.vim \
&& rm -rf ~/.vimrc
