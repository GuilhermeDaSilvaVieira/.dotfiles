-- Crates version, update and more
return {
  "Saecki/crates.nvim",
  event = "BufRead Cargo.toml",
  config = function()
    require("crates").setup({
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    })
  end,
}
