set fish_greeting

set -gx EDITOR subl -w
set -gx PATH ~/bin ~/go/bin ~/.cargo/bin/ /opt/homebrew/bin ~/Library/Python/3.8/bin $PATH
set -gx CDPATH . ~/code ~

function fish_right_prompt
    date "+"(set_color -o yellow)"%H:%M:%S"
end

starship init fish | source

function ls
    lsd $argv
end

function _atuin_preexec --on-event fish_preexec
    set -gx ATUIN_HISTORY_ID (atuin history start "$argv[1]")
end

function _atuin_postexec --on-event fish_postexec
    set -l s $status
    if test -n "$ATUIN_HISTORY_ID"
        RUST_LOG=error atuin history end $ATUIN_HISTORY_ID --exit $s &
        disown
    end
end


function _atuin_history
    set -l h (RUST_LOG=error atuin search -i (commandline -b) 3>&1 1>&2 2>&3)
    commandline -f repaint
    if test -n "$h"
        commandline -r $h
    end
end

bind \cr _atuin_history

function _atui_cancel
    set -l cmd (commandline)
    commandline -f cancel-commandline
    if test -n "$cmd"
        RUST_LOG=error atuin history end (atuin history start "$cmd") --exit 42 &
        disown
    end
end

bind \cc _atui_cancel

function _fzf
    if test -z (commandline)
        commandline -r $history[1]
    end
    set -l h (commandline --tokenize)
    commandline -r ''
    $h | fzf -m --no-sort --cycle --bind ctrl-f:toggle-preview,ctrl-t:toggle-all --preview 'echo {}' --preview-window hidden:wrap | pbcopy
end

bind \cf _fzf
