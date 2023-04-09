-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- Bracket Colorizer
    "p00f/nvim-ts-rainbow",
  },
  config = function()
    require("nvim-treesitter.install").update({ with_sync = true })

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "rust", "lua", "vim" },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
