# Oh-my-zsh stuff
export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="agnoster"

MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='ll'

plugins=(
  git
  nvm
  dnf
  extract
  docker
  docker-compose
  magic-enter
  autojump
)

source $ZSH/oh-my-zsh.sh

# Custom stuff
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/dircolors.zsh
source ~/.zsh/arch.zsh

for i in ${HOME}/.zsh.d/*.zsh
do
  if [ -r ${i} ] ; then
      . ${i}
  fi
done

# Change prompt color if it is SSH connection
prompt_context() {
  if [[ -n $SSH_CONNECTION ]]; then
    prompt_segment red black "%(!.%{%F{yellow}%}.)%n@%m"
  fi
}
