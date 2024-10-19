if status is-interactive
    # freshfetch | lolcat
end

alias l "eza -lag --sort=type"
alias lt "eza --tree"

function v
    if test -n "$argv"
        nvim $argv
    else
        nvim (fzf)
    end
end

function h
    if test -n "$argv"
        hx $argv
    else
        hx (fzf)
    end
end

function nsync
    cd /home/franky/nixos_config
    nix flake update
    nixos-rebuild build --flake .
    doas ./result/bin/switch-to-configuration switch
end

fish_add_path $HOME/.cargo/bin/

set fish_greeting

# Starship Prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

zoxide init fish | source

if test -f "$HOME/.dotfiles/fish/lf_icons.fish"
    source $HOME/.dotfiles/fish/lf_icons.fish
end

if test -f "$HOME/nixos_config/.dotfiles/fish/lf_icons.fish"
    source $HOME/nixos_config/.dotfiles/fish/lf_icons.fish
end
