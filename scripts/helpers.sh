 #!/bin/bash
set -euo pipefail
  
# Common Variables {{{
OS=$(uname)

export OS
export DOTFILES=$HOME/dotfiles
# }}}

# Colorful characters {{{
if [ "$TERM" = 'linux' ]; then
  ARROW='>'
  CMARK='v '
  INFO='i '
  XMARK='x '
else
  ARROW='↪'
  CMARK='✓'
  INFO='ℹ'
  XMARK='✖'
fi

if [ -t 1 ]; then
  # Use colors in terminal
  ARROW="$(tput setaf 2)$ARROW$(tput sgr0)"
  CMARK="$(tput setaf 2)$CMARK$(tput sgr0)"
  INFO="$(tput setaf 3)$INFO$(tput sgr0)"
  XMARK="$(tput setaf 1)$XMARK$(tput sgr0)"
fi
# }}}