default: oh-my-zsh shell-utilities vscode

# Install stuff first cause oh-my-zsh aliases some commands
terminal: shell-utilities oh-my-zsh git

oh-my-zsh:
	yay -S --noconfirm --needed oh-my-zsh-git powerline-fonts
	make stow-zsh

shell-utilites:
	yay -S --noconfirm --needed - < scripts/shell-utilities

vscode:
	yay -S --noconfirm --needed visual-studio-code-bin
	make stow-vscode
	DOTFILES=$(shell pwd) bash scripts/vscode-setup.sh

stow-%:
	stow $* -d symlinks -t ~/

# Hmm, don't think I'll ever use this, but welp
# Most likely just going to copy and paste the last few lines
stow-fstab:
	stow fstab -d symlinks -t /
