#!/bin/bash
set -euo pipefail

# This script is to get the repo and install prerequisites.
# Currently only made for Ubuntu Linux in mind (Probably a relatively newer version as well).
# I might still make it somewhat compatible, but it'll very unlikely run as expected. (For example apt instead of apt-get).

echo "$(tput setaf 3)↪ Making sure packages are up to date...$(tput sgr0)"

sudo apt update
sudo apt upgrade

echo "$(tput setaf 3)↪ Installing some essential packages...$(tput sgr0)"

# Essentials
sudo apt install -y curl wget

# Git
sudo apt install -y git

echo "$(tput setaf 3)↪ Installing NodeJS stuff...$(tput sgr0)"

# NodeJS (Current stable version should be fine)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn

echo "$(tput setaf 3)↪ Cloning repo...$(tput sgr0)"

DOTFILES=$HOME/dotfiles

# Clone repo
if [ -d "$DOTFILES" ]; then
  rm -rf "$DOTFILES"
fi
git clone https://github.com/Vija02/dotfiles.git "$DOTFILES"

# Run install
cd "$DOTFILES"

echo "$(tput setaf 3)↪ Installing dependencies...$(tput sgr0)"

yarn

echo "$(tput setaf 3)↪ Commencing install!$(tput sgr0)"

node install.js
