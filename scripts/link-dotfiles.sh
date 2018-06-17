#!/bin/bash
set -euo pipefail

source "$HOME/dotfiles/scripts/helpers.sh"

for file in $DOTFILES/symlinks/*; do
  target=$HOME/.`basename $file`
  if [ -e "$target" ]; then
    if [[ "$(readlink $target)" != "$file" ]]; then
      if [ -d "$target" ]; then
        echo "  $ARROW moving existing files in $target/"
        for ofile in $target/*; do
          echo "    $ARROW moving $ofile"
          mv "$ofile" "$file/."
        done
        rmdir "$target"
        ln -s "$file" "$target"
        echo "$CMARK $target linked"
      else
        old_path=$HOME/old.`basename $file`
        >&2 echo "$XMARK $target already exists!"
        >&2 echo "  $ARROW Moved $target to $old_path"
        mv "$target" "$old_path" && ln -s "$file" "$target"
        echo "$CMARK $target linked"
      fi
    fi
  else
    ln -s "$file" "$target"
    echo "$CMARK $target linked"
  fi
done

if [ -n "$ERRORS" ]; then
  # Use printf instead of echo since we have a trailing newline
  >&2 printf "%s" "$ERRORS"
  >&2 printf "\nOverwrite old files with '%s'\n" "${0##*/} -f"
  exit 1
else
  echo "$CMARK All dotfiles files linked"
fi
