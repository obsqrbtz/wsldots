#!/bin/bash

# Stop on errors
set -else
  
git submodule init
git submodule update --recursive

sudo pacman -Sy --noconfirm
sudo pacman -S --noconfirm stow nodejs npm dotnet-sdk dotnet-sdk-8.0 unzip zsh openssh cmake ninja clang zoxide lsd bat fzf fd ripgrep ranger wget git-delta mesa glu libxkbcommon fontconfig freetype2 ttf-dejavu
sudo localectl set-locale LANG=en_US.UTF-8

chsh -s /usr/bin/zsh "$(whoami)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

rm ~/.zshrc

stow -R -v -t ~ .

zsh
