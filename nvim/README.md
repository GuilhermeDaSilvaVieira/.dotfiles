## Description

Neovim configuration designed to bring Neovim closer to an IDE experience. My 
current Neovim configuration is based on 
[Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) repo and
in this [playlist](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

## How to use

Before cloning this repo make sure you have set your terminal font to some 
[Nerd Font](https://github.com/ryanoasis/nerd-fonts) and have installed the 
latest version of this packages: `nvim-packer`, `fzf`, `neovim`, `tree-sitter`,
`python-pynvim`

```
cd ~/.config/
git clone https://github.com/GuilhermeDaSilvaVieira/neovim_config
mv neovim_config nvim
cd nvim
nvim init.lua 
:so 
:e ~/.config/nvim/lua/user/plugins.lua
:so
:PackerSync
:q
```
All set. Enjoy
