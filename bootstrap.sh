#!/bin/bash
set -o pipefail

# This script is to get the repo and install prerequisites.
# Currently only made for Ubuntu Linux in mind (Probably a relatively newer version as well).
# I might still make it somewhat compatible, but it'll very unlikely run as expected. (For example apt instead of apt-get).

sudo apt update
sudo apt upgrade

# Essentials
sudo apt install -y curl wget

# Git
sudo apt install -y git

# NodeJS (Current stable version should be fine)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install --lts

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn

# Clone repo
git clone https://github.com/Vija02/dotfiles.git ~/dotfiles

# Run install
cd ~/dotfiles
yarn
node install.js
