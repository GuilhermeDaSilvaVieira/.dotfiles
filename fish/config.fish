﻿if status is-interactive
    fastfetch
end

alias l "eza -lag --sort=type"
alias lt "eza --tree"

function h
    if test -n "$argv"
        helix $argv
    else
        helix (fzf)
    end
end

fish_add_path $HOME/.cargo/bin/
fish_add_path $HOME/.npm-global/bin/
fish_add_path $HOME/.pub-cache/bin/

if test "$USER" = franky
    set -gx ANDROID_HOME $HOME/Android/Sdk/
    set -gx CHROME_EXECUTABLE /usr/bin/chromium
    mise activate fish | source
end

set -gx EDITOR helix
set -gx VISUAL helix

set fish_greeting

# Starship Prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source

enable_transience

zoxide init fish | source
