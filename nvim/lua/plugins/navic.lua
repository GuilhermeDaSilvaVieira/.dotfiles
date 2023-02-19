-- lsp symbol navigation for lualine
return {
  "SmiteshP/nvim-navic",
  -- dependencies = "neovim/nvim-lspconfig",
  -- event = "VeryLazy",
  opts = function()
    return {
      separator = " ",
      highlight = true,
    }
  end,
}
