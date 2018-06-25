#!/bin/bash
set -o pipefail

EXTENSIONS=$(xargs < "$DOTFILES/scripts/vscode-extensions")

for extension in $EXTENSIONS; do
  code --install-extension $extension
done
