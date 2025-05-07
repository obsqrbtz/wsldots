#!/bin/bash

# Stop on errors
set -e

git submodule init
git submodule update --recursive

sudo pacman -Sy --noconfirm
sudo pacman -S --noconfirm stow zsh gcc cmake clang neovim zoxide lsd bat fzf fd ripgrep ranger wget git-delta

chsh -s /usr/bin/zsh $(whoami)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

rm ~/.zshrc

stow -R -v -t ~ .

zsh
