# In case called when it's not on ~/.dotfiles/
cd ~/.dotfiles/

# Get submodules
git submodule init
git submodule update

cd ~/.config/

# Remove any existing config folders that can have a conflict
# Maybe rename awesome to awesome.old
rm awesome fish kitty nvim picom ranger rofi -rf

# Simlink everything
ln -sf ~/.dotfiles/awesome/ ~/.config/awesome
ln -sf ~/.dotfiles/fish/ ~/.config/fish
ln -sf ~/.dotfiles/kitty/ ~/.config/kitty
ln -sf ~/.dotfiles/nvim/ ~/.config/nvim
ln -sf ~/.dotfiles/picom/ ~/.config/picom
ln -sf ~/.dotfiles/ranger/ ~/.config/ranger
ln -sf ~/.dotfiles/rofi/ ~/.config/rofi
