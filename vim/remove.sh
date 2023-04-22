#!/usr/bin/env bash

sudo apt remove -y --purge \
    vim \
&& vim -es -u ~/.vimrc -i NONE -c "PlugClean" -c "qa" \
&& rm -rf ~/.vim \
&& rm -rf ~/.vimrc
