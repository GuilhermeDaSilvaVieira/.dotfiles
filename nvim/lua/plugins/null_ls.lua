-- Formatting
return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>f",
      ":Format<CR>",
      silent = true,
      noremap = true,
      desc = "Format current buffer",
    },
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
      },
    })
  end,
}
