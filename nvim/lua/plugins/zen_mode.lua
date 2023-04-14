return {
  "folke/zen-mode.nvim",
  config = true,
  keys = {
    {
      "<leader>z",
      ":ZenMode<cr>",
      noremap = true,
      silent = true,
      desc = "Toggle [Z]enMode",
    },
  },
}
