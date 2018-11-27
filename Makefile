default: oh-my-zsh shell-utilities vscode

# Install stuff first cause oh-my-zsh aliases some commands
terminal: shell-utilities oh-my-zsh git

oh-my-zsh:
	yay -S --noconfirm --needed oh-my-zsh-git powerline-fonts
	stow zsh -d symlinks -t ~/

git:
	stow git -d symlinks -t ~/

shell-utilites:
	yay -S --noconfirm --needed - < scripts/shell-utilities

# Hmm, don't think I'll ever use this, but welp
# Most likely just going to copy and paste the last few lines
fstab:
	stow fstab -d symlinks -t /

vscode:
	yay -S --noconfirm --needed visual-studio-code-bin
	stow vscode -d symlinks -t ~/
	DOTFILES=$(shell pwd) bash scripts/vscode-setup.sh
