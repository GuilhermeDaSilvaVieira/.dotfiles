-- Terminal Inside Neovim
return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true, buffer = 0 }
      -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    vim.keymap.set(
      "n",
      "<leader>tg",
      "<cmd>lua _LAZYGIT_TOGGLE()<cr>",
      { noremap = true, silent = true, desc = "Toggle Lazygit" }
    )

    local btop = Terminal:new({ cmd = "btop", hidden = true })
    function _BTOP_TOGGLE()
      btop:toggle()
    end

    vim.keymap.set(
      "n",
      "<leader>tb",
      "<cmd>lua _BTOP_TOGGLE()<cr>",
      { noremap = true, silent = true, desc = "Toggle Btop" }
    )
  end,
}
