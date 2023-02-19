-- Add indentation guides even on blank lines
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  config = function()
    -- See `:help indent_blankline.txt`
    require("indent_blankline").setup({
      char = "┊",
      show_trailing_blankline_indent = false,
    })
  end,
}
