#!/bin/bash
set -euo pipefail

sudo apt install -y \
  zsh fonts-powerline \
  git stow make \ # Stuff the installer needs
  autojump \ # Stuff our config uses
  nano # Stuff that i expect to be there

mkdir ~/.zsh.d/
touch ~/.zsh.d/local.zsh

# Copy the config first so we don't need to deal with replacing it later
rm -f ~/.zshrc
make stow-zsh

sudo su <<HERE
export ZSH="/usr/share/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended --keep-zshrc
HERE

sudo chsh -s /bin/zsh $USER