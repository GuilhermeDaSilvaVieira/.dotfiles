# Remove any existing config folders that can have a conflict and symlink

rm ~/.config/awesome
ln -s ~/.dotfiles/awesome/ ~/.config/

rm ~/.config/btop
ln -s ~/.dotfiles/btop/ ~/.config/

rm ~/.config/cava
ln -s ~/.dotfiles/cava/ ~/.config/

rm ~/.config/eww
ln -s ~/.dotfiles/eww/ ~/.config/

rm ~/.config/fish
ln -s ~/.dotfiles/fish/ ~/.config/

rm ~/.config/helix
ln -s ~/.dotfiles/helix/ ~/.config/

rm ~/.config/kitty
ln -s ~/.dotfiles/kitty/ ~/.config/

rm ~/.config/MangoHud
ln -s ~/.dotfiles/MangoHud/ ~/.config/

rm ~/.config/nvim
ln -s ~/.dotfiles/nvim/ ~/.config/

rm ~/.config/picom
ln -s ~/.dotfiles/picom/ ~/.config/

rm ~/.config/river
ln -s ~/.dotfiles/river/ ~/.config/

rm ~/.config/rofi
ln -s ~/.dotfiles/rofi/ ~/.config/

rm ~/.config/starship.toml
ln -s ~/.dotfiles/starship/starship.toml ~/.config/

rm ~/.config/yazi
ln -s ~/.dotfiles/yazi/ ~/.config/

rm ~/.config/zathura
ln -s ~/.dotfiles/zathura/ ~/.config/

rm ~/media
ln -s /run/media/$USER/ ~/media
