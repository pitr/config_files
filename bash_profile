# If not running interactively, don't do anything
[ -z "$PS1" ] && return


source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/configs

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# first in PATH is bundler's bin folder
export PATH=,:"${PATH}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
