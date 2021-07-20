#!/bin/bash
set -euo pipefail

sudo apt install -y \
  zsh fonts-powerline \
  # Stuff the installer needs
  git stow make \
  # Stuff our config uses
  autojump \
  # Stuff that i expect to be there
  nano

mkdir ~/.zsh.d/
touch ~/.zsh.d/local.zsh

# Copy the config first so we don't need to deal with replacing it later
rm -f ~/.zshrc
make stow-zsh

sudo su

export ZSH="/usr/share/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended --keep-zshrc

exit

sudo chsh -s /bin/zsh $USER