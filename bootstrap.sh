#!/bin/bash
set -euo pipefail

# This script is to get the repo and install prerequisites.

# Check distributions and their versions
# https://unix.stackexchange.com/questions/6345/how-can-i-get-distribution-name-and-version-number-in-a-simple-shell-script
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	OS=$(lsb_release -si)
	VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	OS=$DISTRIB_ID
	VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	OS=Debian
	VER=$(cat /etc/debian_version)
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	OS=$(uname -s)
	VER=$(uname -r)
fi

install_node(){
	# NodeJS (Current stable version should be fine)
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	nvm install --lts
}

# Handle Fedora & Ubuntu
if [ $OS = 'Fedora' ]; then
	echo "$(tput setaf 3)↪ Making sure packages are up to date...$(tput sgr0)"
	sudo dnf -y update
	sudo dnf -y upgrade

	echo "$(tput setaf 3)↪ Installing some essential packages...$(tput sgr0)"
	sudo dnf install -y curl wget make git

	echo "$(tput setaf 3)↪ Installing NodeJS stuff...$(tput sgr0)"
	install_node

	# Yarn
	curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
	sudo dnf -y install yarn
elif [ $OS = 'Debian' ]; then
	echo "$(tput setaf 3)↪ Making sure packages are up to date...$(tput sgr0)"
	sudo apt -y update
	sudo apt -y upgrade

	echo "$(tput setaf 3)↪ Installing some essential packages...$(tput sgr0)"
	sudo apt install -y curl wget make git

	echo "$(tput setaf 3)↪ Installing NodeJS stuff...$(tput sgr0)"
	install_node

	# Yarn
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update && sudo apt -y install --no-install-recommends yarn
else
	echo "$(tput setaf 1)✗ Bootstrap failed. Distribution currently not supported. Only Fedora & Ubuntu(maybe) supported$(tput sgr0)"
	exit 1
fi

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
