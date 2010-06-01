# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTCONTROL=ignoredups
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

alias ls="ls --color -Fh"
alias ll="ls -Al"
alias l="ls -AF"

alias ssh="ssh -X"
alias s="screen"
alias v="vim"
alias p="python"

GREEN="\[\033[0;32m\]"
WHITE="\[\033[1;37m\]"
NONE="\[\033[0m\]"
PS1="\n${GREEN}-==[${WHITE}\h${GREEN}]=-=[${WHITE}\$(date +%d%m):\$(date +%H%M)${GREEN}]=-=[${WHITE}\w${GREEN}]==-\n${WHITE}#${NONE} "
