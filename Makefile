default: install-packages oh-my-zsh-setup link-dotfiles

install-packages:
	packages/install-packages.sh

oh-my-zsh-setup:
	scripts/oh-my-zsh-setup.sh

link-dotfiles:
	scripts/link-dotfiles.sh