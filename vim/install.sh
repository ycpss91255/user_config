#!/usr/bin/env bash

sudo apt update \
    && sudo apt install -y --no-install-recommends \
        git \
        vim \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && cp vimrc ~/.vimrc
