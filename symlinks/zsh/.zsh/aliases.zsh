alias l='ls -lh'
alias ll='ls -lAh'
alias pls='sudo $(fc -ln -1)'
alias myssh='cat ~/.ssh/id_rsa.pub'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias xclip='xclip -selection clipboard'

# Git
alias fp='git fetch && git pull'
alias branch="git branch | awk -F: '{print $1}'"
alias gb="git branch | awk -F: '{print $1}'"

# Other programs (needs installation)
alias ranger='source ranger'
