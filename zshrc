source ~/.bash/aliases
source ~/.bash/configs
source ~/.bash/custom

setopt append_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

eval "$(starship init zsh)"

autoload -Uz compinit
compinit

complete -C ~/.bash/project_completion -o default c

local WORDCHARS=''
