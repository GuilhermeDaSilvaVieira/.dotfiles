-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Set relative and absolute numbers 
vim.wo.relativenumber = true
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Simple Formatting
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.opt.softtabstop = 2
vim.o.smartindent = true

-- Cursor line highlight
vim.o.cursorline = true

-- Key combination timeout
vim.o.updatetime = 50

-- Show mode only on Lua Line
vim.o.showmode = false

-- Seconds to wait for key map
vim.o.timeoutlen = 300
vim.o.timeout = true

-- Max blank lines
vim.o.scrolloff = 8

-- Visual reminder of good text width
vim.o.colorcolumn = "80"

-- NO SWAP FILES!!!!
vim.o.swapfile = false

-- Save undo history
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.undodir = os.getenv("HOME") .. "/.nvim/undo/"

-- Security backup
vim.o.backup = true
vim.o.backupdir = os.getenv("HOME") .. "/.nvim/backup/"

-- Use real colors in themes
vim.o.termguicolors = true

-- Never have a status bar on another window
vim.o.laststatus = 0

-- Navic on Winbar
vim.o.winbar = "%f %m| %{%v:lua.require'nvim-navic'.get_location()%}"
