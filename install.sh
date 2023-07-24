# Remove any existing config folders that can have a conflict
cd ~/.config/
rm awesome fish kitty nvim picom starship.toml lf btop zathura MangoHud cava\
 ~/.librewolf/*-release/chrome -rf
rm ~/media

# Symlink everything
ln -s ~/.dotfiles/awesome/ ~/.config/
ln -s ~/.dotfiles/fish/ ~/.config/
ln -s ~/.dotfiles/kitty/ ~/.config/
ln -s ~/.dotfiles/nvim/ ~/.config/
ln -s ~/.dotfiles/picom/ ~/.config/
ln -s ~/.dotfiles/lf/ ~/.config/
ln -s ~/.dotfiles/btop/ ~/.config/
ln -s ~/.dotfiles/starship/starship.toml ~/.config/
ln -s ~/.dotfiles/zathura/ ~/.config/
ln -s ~/.dotfiles/chrome/ ~/.librewolf/*-release/
ln -s ~/.dotfiles/MangoHud/ ~/.config/
ln -s ~/.dotfiles/cava/ ~/.config/
ln -s /run/media/$USER/ ~/media
