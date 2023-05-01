#!/usr/bin/env bash

# ${1}: USER NAME

# file_dir=$(dirname "$(readlink -f "${0}")")
username=${1:-"$USER"}

fish -c "set -eU fish_user_paths"
echo 'y' | /home/${username}/.fzf/uninstall --xdg
sudo apt purge -y \
    fzf \
    fd-find \
    fish
pip uninstall -y thefuck
sudo rm -rf /home/"${username}"/.config/fish \
    /home/"${username}"/.fzf \
    /usr/local/bin/fd \
    /usr/local/bin/bat
sudo add-apt-repository --remove -y ppa:fish-shell/release-3
