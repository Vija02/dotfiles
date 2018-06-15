#!/bin/bash
set -o pipefail

if [ -z "$DISPLAY" ]; then
  IS_HEADLESS=1
else
  IS_HEADLESS=0
fi

PACKAGES=$(xargs < "~/dotfiles/packages/apt-packages-headless")
if [ "$IS_HEADLESS" != 1 ]; then
  # GUI-only packages
  PACKAGES="$PACKAGES $(xargs < "~/dotfiles/packages/apt-packages-essentials")"
  # PACKAGES="$PACKAGES $(xargs < "~/dotfiles/packages/apt-packages")"
fi

sudo apt -fuy install $PACKAGES