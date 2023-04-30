#!/usr/bin/env bash

# ${1}: USER NAME

file_dir=$(dirname "$(readlink -f "${0}")")
username=${1:-"$USER"}

sudo apt update && \
sudo apt install -y --no-install-recommends \
    software-properties-common \
    gnupg-agent \
    fontconfig \
    wget \
    git \
    curl \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    fzf \
    bat \
    fd-find && \
pip3 install --upgrade pip && \
pip3 install --upgrade thefuck --user && \
mkdir -p "/home/${username}/.local/share/" && \
mkdir -p "/home/${username}/.config/fish/" && \
cp -r "${file_dir}/fonts" "/home/${username}/.local/share/" && \
sudo fc-cache -f && \
sudo apt-add-repository -y ppa:fish-shell/release-3 && \
sudo apt update && \
sudo apt install -y --no-install-recommends \
    fish && \
sudo ln -sf "$(which fdfind)" /usr/local/bin/fd && \
sudo ln -sf "$(which batcat)" /usr/local/bin/bat && \
rm -rf "/home/${username}/.fzf" && \
git clone --depth 1 https://github.com/junegunn/fzf.git /home/"${username}"/.fzf && \
cp -r "${file_dir}/config/." "/home/${username}/.config/fish/" && \
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
    | fish -c "source && \
        fisher install jorgebucaran/fisher && \
        fisher install IlanCosman/tide@v5 && \
        fisher install andreiborisov/sponge && \
        fisher install jorgebucaran/autopair.fish && \
        fisher install PatrickF1/fzf.fish && \
        fisher install oh-my-fish/plugin-thefuck && \
        fisher install edc/bass && \
        fisher install joseluisq/gitnow@2.11.0 && \
        fisher add markcial/upto && \
        fisher install danhper/fish-ssh-agent && \
        /home/${username}/.fzf/install --all && \
        set -U fish_user_paths /home/$username/.local/bin \$fish_user_paths"

read -rp "Change default shell?" reaction
if [[ "$reaction" =~ ^[Yy]$ ]]; then
    chsh -s "$(which fish)"
fi
