default: oh-my-zsh shell-utilities vscode

oh-my-zsh:
	yay -S --noconfirm --needed oh-my-zsh-git powerline-fonts
	stow zsh -d symlinks -t ~/

shell-utilites:
	yay -S --noconfirm --needed - < scripts/shell-utilities

vscode:
	yay -S --noconfirm --needed visual-studio-code-bin
	stow vscode -d symlinks -t ~/
	DOTFILES=$(shell pwd) bash scripts/vscode-setup.sh
