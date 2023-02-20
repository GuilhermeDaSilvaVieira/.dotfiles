-- TODO, FIX, NOTE, HACK, PERF, WARNING, all in one plugin
return {
  "folke/todo-comments.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      noremap = true,
      silent = true,
      desc = "Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      noremap = true,
      silent = true,
      desc = "Previous todo comment",
    },
    {
      "<leader>st",
      noremap = true,
      silent = true,
      ":TodoTelescope<CR>",
      desc = "[S]earch [T]odo",
    },
  },
  config = true,
}
