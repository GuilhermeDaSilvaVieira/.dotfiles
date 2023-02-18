-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  dependencies = {
    -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- Bracket Colorizer
    "p00f/nvim-ts-rainbow",
  },
}
