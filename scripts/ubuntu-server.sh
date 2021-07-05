#!/bin/bash

sudo bash scripts/oh-my-zsh-setup.sh
sudo apt install -y autojump stow build-essential
rm ~/.zshrc
make stow-zsh

mkdir ~/.zsh.d
touch ~/.zsh.d/local.zsh

sudo chsh -s /usr/bin/zsh $USER
