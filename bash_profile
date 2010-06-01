# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

GREEN="\[\033[0;32m\]"
WHITE="\[\033[1;37m\]"
NONE="\[\033[0m\]"
PS1="\n${GREEN}-==[${WHITE}\h${GREEN}]=-=[${WHITE}\$(date +%d%m):\$(date +%H%M)${GREEN}]=-=[${WHITE}\w${GREEN}]==-\n${WHITE}#${NONE} "
