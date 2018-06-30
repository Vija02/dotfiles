# Oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
plugins=(
  git
  zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# Custom stuff
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
