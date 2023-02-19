return {
  -- Cobalt 2 Don't strain your eyes
  {
    "lalitmee/cobalt2.nvim",
    priority = 1000,
    dependencies = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("colorbuddy").colorscheme("cobalt2")
    end,
  },
  -- Theme inspired by Atom
  {
    "navarasu/onedark.nvim",
    lazy = true,
    -- priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("onedark")
    end,
  },
}
