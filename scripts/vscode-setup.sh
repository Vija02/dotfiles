<<<<<<< HEAD
#!/bin/bash
set -o pipefail

EXTENSIONS=$(xargs < "$DOTFILES/scripts/vscode-extensions")

for extension in $EXTENSIONS; do
  code --install-extension $extension
done
=======
# OTW
>>>>>>> db85a59665c575741bd7627e0340689609b76d20
