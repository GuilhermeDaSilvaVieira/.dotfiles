-- The AI era is now, use it or get obsolete
return {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>cgi",
      "<cmd>:ChatGPT<cr>",
      silent = true,
      noremap = true,
      desc = "Open interactive window of ChatGPT",
    },
    {
      "<leader>cga",
      "<cmd>:ChatGPTActAs<cr>",
      silent = true,
      noremap = true,
      desc = "Selection of awesome prompt for ChatGPT",
    },
    {
      "<leader>cge",
      "<cmd>:ChatGPTEditWithInstructions<cr>",
      mode = "v",
      silent = true,
      noremap = true,
      desc = "Edit selection with ChatGPT",
    },
    {
      "<leader>cgr",
      ":ChatGPTRun",
      mode = "v",
      desc = "Run ChatGPT with some action",
    },
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "gpg --decrypt ~/Documents/chagpt_key.txt.gpg 2>/dev/null",
      chat = {
        max_line_length = 80,
      },
    })
  end,
}
