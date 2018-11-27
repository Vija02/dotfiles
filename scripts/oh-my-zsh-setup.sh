#!/bin/bash
set -euo pipefail

sudo apt install -y zsh fonts-powerline

export ZSH="/usr/share/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
