# Oh-my-zsh stuff
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='ll'

ENABLE_CORRECTION="true"
plugins=(
  git
  nvm
  dnf
  extract
  docker
  docker-compose
  magic-enter
)

source $ZSH/oh-my-zsh.sh

# Custom stuff
source ~/.zsh/aliases.zsh
