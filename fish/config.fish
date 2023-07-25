if status is-interactive
  freshfetch
end

alias l "exa -lag --sort=type"
alias v "nvim (fzf)"
alias lf "~/.dotfiles/lf/lfrun"

fish_add_path $HOME/.cargo/bin/

set fish_greeting

starship init fish | source

if test -f "$HOME/.dotfiles/fish/lf_icons.fish"
  source $HOME/.dotfiles/fish/lf_icons.fish
end

export FZF_DEFAULT_COMMAND="fd -H"
export BROWSER="/usr/bin/librewolf"
export EDITOR="nvim"
export READER="zathura"
