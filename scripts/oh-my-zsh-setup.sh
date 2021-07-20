#!/bin/bash
set -euo pipefail

export ZSH="/usr/share/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
