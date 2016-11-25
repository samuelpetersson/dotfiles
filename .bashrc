set -o vi

PS1='\W$(vcprompt -f "[%b%m%u]") '

alias l="ls -al"
alias p="pwd"
alias s="git status"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

 if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
 fi
