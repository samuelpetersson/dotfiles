PS1='\W$(vcprompt -f "[%b%m%u]") '

alias l="ls -l"
alias p="pwd"
alias s="git status"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

 if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
 fi
