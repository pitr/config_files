# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/.bash/aliases
source ~/.bash/bash
source ~/.bash/configs
source ~/.bash/custom

complete -C ~/.bash/project_completion -o default c

export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/.bash/zkubectl.bash.inc
