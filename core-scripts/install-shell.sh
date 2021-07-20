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

sudo su <<HERE
export ZSH="/usr/share/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended --keep-zshrc
HERE

sudo chsh -s /bin/zsh $USER