set fish_greeting

set -gx EDITOR subl -w
set -gx PATH ~/bin ~/go/bin /opt/homebrew/bin $PATH
set -gx CDPATH . ~/code ~

set -gx HOMEBREW_NO_ENV_HINTS 1

abbr -a -g .. cd ..
abbr -a -g ... cd ../..
abbr -a -g c cd
abbr -a -g e subl .
abbr -a -g ga git a
abbr -a -g gadd 'git add -u && git add . && git status'
abbr -a -g gb git b
abbr -a -g gbb git bb
abbr -a -g gbc 'git branch --merged | egrep -v \'(master|main|^\*)\' | xargs -n 1 git branch -d'
abbr -a -g gbs git bs
abbr -a -g gc git c
abbr -a -g gca git ca
abbr -a -g gcan git can
abbr -a -g gd git d
abbr -a -g gdc git dc
abbr -a -g gg git g
abbr -a -g gpl git pl
abbr -a -g gps git ps
abbr -a -g gr git r
abbr -a -g gra git ra
abbr -a -g grb git rb
abbr -a -g grc git rc
abbr -a -g gs git s
abbr -a -g gst git st
abbr -a -g gt git t
abbr -a -g gup git up
abbr -a -g sta git stash
abbr -a -g uns git stash pop

starship init fish | source

function gitx
    open -a GitX .
end

# custom

