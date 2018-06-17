#!/bin/bash
set -euo pipefail

sudo apt install -y zsh fonts-powerline

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
