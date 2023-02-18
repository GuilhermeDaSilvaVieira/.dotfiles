-- File Manager
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      "<cmd>:Neotree toggle<cr>",
      silent = true,
      noremap = true,
      desc = "Open File Manager",
    },
  },
  config = function()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = true,
        filtered_items = { hide_dotfiles = false },
      },
    })
  end,
}
