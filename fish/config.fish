if status is-interactive
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
  freshfetch
end

alias l "eza -lag --sort=type"

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

fish_add_path $HOME/.cargo/bin/

set fish_greeting

starship init fish | source

if test -f "$HOME/.dotfiles/fish/lf_icons.fish"
  source $HOME/.dotfiles/fish/lf_icons.fish
end
