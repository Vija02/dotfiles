#!/bin/bash
set -euo pipefail

args=(
  zsh fonts-powerline
  # Stuff the installer needs
  git stow make
  # Stuff our config uses
  autojump
  # Stuff that i expect to be there
  nano
)

sudo apt install -y "${args[@]}"

mkdir -p ~/.zsh.d/
touch ~/.zsh.d/local.zsh

# Copy the config first so we don't need to deal with replacing it later
rm -f ~/.zshrc
make stow-zsh

sudo bash scripts/oh-my-zsh-setup.sh

sudo chsh -s /bin/zsh $USER