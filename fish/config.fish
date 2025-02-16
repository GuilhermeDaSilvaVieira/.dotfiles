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
    set initial_dir $PWD

    # Avoids multiple arguments
    if test (count $argv) -gt 1
        echo "Too many arguments"
        return
    end

    # Check if the first argument is '-s'
    if test (count $argv) -gt 0
        if test "$argv[1]" = -s
            echo "Updating..."
            cd $HOME/nixos_config/
            nix flake update
        else
            echo "Invalid argument"
            echo "Moving back to initial directory..."
            cd $initial_dir
            return
        end
    end

    echo "Copying..."
    cp -r $HOME/nixos_config/ $HOME/nixos_config_without_git

    echo "Changing to copy directory..."
    cd $HOME/nixos_config_without_git || return # Exit if cd fails

    echo "Removing .git"
    rm -rf .git/

    echo "Rebuilding..."
    doas nixos-rebuild switch --flake .

    echo "Removing copy..."
    rm -rf $HOME/nixos_config_without_git/

    echo "Moving back to initial directory..."
    cd $initial_dir
end

fish_add_path $HOME/.cargo/bin/
fish_add_path $HOME/.npm-global/bin/

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
