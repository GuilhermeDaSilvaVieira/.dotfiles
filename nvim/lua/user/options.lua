local set = vim.opt

set.backup = false
--[[ set.path:append("**") ]]
--[[ set.wildmenu = true ]]
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.termguicolors = true
set.number = true
set.updatetime = 300
set.background = "dark"
set.smartindent = true
set.smartcase = true
set.cursorline = true
set.cmdheight = 0
set.ignorecase = true
--[[ set.showtabline = 2 ]]
set.showmode = false
set.undofile = true
set.timeoutlen = 1000
set.ls = 0
--[[ set.winbar = "%=%m %f" ]]
set.winbar = "%f %m"

vim.cmd([[
colorscheme cobalt2
]])
