--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set(
  "n",
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true }
)
vim.keymap.set(
  "n",
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true }
)

--[[ Reduce boilerplate code ]]
local nmap = function(keys, func, desc)
  vim.keymap.set(
    "n",
    keys,
    func,
    { silent = true, noremap = true, desc = desc }
  )
end

local imap = function(keys, func, desc)
  vim.keymap.set(
    "i",
    keys,
    func,
    { silent = true, noremap = true, desc = desc }
  )
end

local vmap = function(keys, func, desc)
  vim.keymap.set(
    "v",
    keys,
    func,
    { silent = true, noremap = true, desc = desc }
  )
end

local xmap = function(keys, func, desc)
  vim.keymap.set(
    "x",
    keys,
    func,
    { silent = true, noremap = true, desc = desc }
  )
end

-- Keep previous paste
xmap("<leader>p", '"_dP', "Keep previous paste")

-- Save
nmap("<leader>w", ":w<cr>", "Save buffer")

-- Toggle spell checker
nmap("<leader>sc", ":set spell! | set spell? <cr>", "Toggle spell checker")

-- Keep cursor on center
nmap("J", "mzJ`z")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Use clipboard
nmap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')
vmap("<leader>y", '"+y')

-- Resize window using <ctrl> arrow keys
nmap("<C-Up>", ":resize +2<cr>", "Increase window height")
nmap("<C-Down>", ":resize -2<cr>", "Decrease window height")
nmap("<C-Left>", ":vertical resize -2<cr>", "Decrease window width")
nmap("<C-Right>", ":vertical resize +2<cr>", "Increase window width")

-- Move to window using the <ctrl> hjkl keys
nmap("<C-h>", "<C-w>h", "Go to left window")
nmap("<C-j>", "<C-w>j", "Go to lower window")
nmap("<C-k>", "<C-w>k", "Go to upper window")
nmap("<C-l>", "<C-w>l", "Go to right window")

-- Switch buffers
nmap("]b", ":bnext<cr>", "Go to next buffer")
nmap("[b", ":bprevious<cr>", "Go to previous buffer")

-- Substitute
vim.keymap.set(
  "n",
  "<leader>ss",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
  { desc = "Substitute highlighted word" }
)

-- Escape
imap("jk", "<ESC>", "Shortcut for ESC")

-- Indent
vmap("<", "<gv", "Left indent")
vmap(">", ">gv", "Right indent")

-- Move selected text
vmap("<A-j>", ":m '>+1<cr>gv=gv", "Move Selected UP")
vmap("<A-k>", ":m '<-2<cr>gv=gv", "Move Selected DOWN")
