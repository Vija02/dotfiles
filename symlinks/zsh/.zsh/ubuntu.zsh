# Only run this if apt exist
if command -v apt > /dev/null; then

  # JI(Just install for me pls)
  function ji(){
    sudo apt install -y "$1"
  }

fi
