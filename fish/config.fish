if status is-interactive
	fastfetch
end

alias l "exa -lag --sort=type"
alias v "nvim (fzf)"
alias lf "~/.dotfiles/lf/lfrun"

# fish_add_path $HOME/.dotfiles/scripts/

set fish_greeting

starship init fish | source

source $HOME/.dotfiles/fish/lf_icons.fish

export FZF_DEFAULT_COMMAND="fd -H"
export BROWSER="/usr/bin/librewolf"
export EDITOR="nvim"
export READER="zathura"
