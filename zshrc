source ~/.bash/aliases
source ~/.bash/configs
source ~/.bash/custom

eval "$(starship init zsh)"

autoload -Uz compinit
compinit

complete -C ~/.bash/project_completion -o default c

local WORDCHARS=''
