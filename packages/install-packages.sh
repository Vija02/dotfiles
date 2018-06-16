#!/bin/bash
set -o pipefail

if [ -z "$DISPLAY" ]; then
  IS_HEADLESS=1
else
  IS_HEADLESS=0
fi

DOTFILES=$HOME/dotfiles

# Install essential packages

PACKAGES=$(xargs < "$DOTFILES/packages/apt-packages-essentials")
sudo apt -fuy install $PACKAGES

PACKAGES="$(xargs < "$DOTFILES/packages/apt-packages-headless")"
if [ "$IS_HEADLESS" != 1 ]; then
  # GUI-only packages
  PACKAGES="$PACKAGES $(xargs < "$DOTFILES/packages/apt-packages")"
fi

PACKAGES_TO_INSTALL=
for package in $PACKAGES; do
  if [ "$package" = "docker" ]; then
    curl -sSL https://get.docker.com/ | sh
    pip install docker-compose
  elif [ "$package" = "vlc" ]; then
    add-apt-repository ppa:videolan/master-daily
    sudo apt update
    sudo apt install vlc qtwayland5
  elif [ "$package" = "chrome" ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt update
    sudo apt install -y google-chrome-stable
  elif [ "$package" = "vscode" ]; then
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt update
    sudo apt install code
  else
    PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $package"
  fi
done

sudo apt -fuy install $PACKAGES_TO_INSTALL