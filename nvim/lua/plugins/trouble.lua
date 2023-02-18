-- Errors, Warning, Diagnostics, Quickfix
return {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    {
      "<leader>xx",
      "<cmd>TroubleToggle<cr>",
      noremap = true,
      silent = true,
      desc = "Toggle Trouble",
    },
    {
      "<leader>xw",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      noremap = true,
      silent = true,
      desc = "Toggle Workspace Diagnostics in Trouble",
    },
    {
      "<leader>xd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      noremap = true,
      silent = true,
      desc = "Toggle Document Diagnostics in Trouble",
    },
    {
      "<leader>xl",
      "<cmd>TroubleToggle loclist<cr>",
      noremap = true,
      silent = true,
      desc = "Toggle Loclist in Trouble",
    },
    {
      "<leader>xq",
      "<cmd>TroubleToggle quickfix<cr>",
      noremap = true,
      silent = true,
      desc = "Toggle Quickfix in Trouble",
    },
  },
  config = function()
    require("trouble").setup({
      auto_close = true,
      use_diagnostic_signs = true,
    })
  end,
}
