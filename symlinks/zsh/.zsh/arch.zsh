# Only run this if pacman exist
if command -v pacman > /dev/null; then

  # JI(Just install for me pls)
  function ji(){
    yay -S --noconfirm "$1"
  }

fi
