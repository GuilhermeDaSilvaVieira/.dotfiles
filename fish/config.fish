if status is-interactive
    # Commands to run in interactive sessions can go here
end

export FZF_DEFAULT_COMMAND="fd -H"
export BROWSER="/usr/bin/librewolf"
fish_add_path "/home/guilherme/Dev/Flutter/SDK/flutter/bin/"
fish_add_path "/home/guilherme/.cargo/bin/"

alias l "exa -la --sort=type"
alias v "nvim"
alias cat "bat"

set fish_greeting
