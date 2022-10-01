vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
	-- Plugins para suporte de outros plugins
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "wbthomason/packer.nvim" })

	-- FZF
	use({ "junegunn/fzf" })

	-- ToggleTerm
	use({ "akinsho/toggleterm.nvim" })

	-- AutoPairs
	use({ "jiangmiao/auto-pairs" })

	use("lukas-reineke/indent-blankline.nvim")

	-- Temas
	use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Auto completar
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	-- Snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "honza/vim-snippets" })

	-- LSP
	use({ "neovim/nvim-lspconfig", requires = "williamboman/nvim-lsp-installer" })

	-- Melhores luzes na sintaxe
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "p00f/nvim-ts-rainbow" })

	-- Comentários
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "numToStr/Comment.nvim" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- BufferLine
	use({
		"akinsho/bufferline.nvim",
		requires = {
			"moll/vim-bbye",
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Null-ls
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- Lualine
	use({ "nvim-lualine/lualine.nvim" })

	-- Nvim-tree
	use({ "kyazdani42/nvim-tree.lua" })

	-- Flutter
	use({ "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "dart-lang/dart-vim-plugin" })
	use({ "natebosch/dartlang-snippets" })

	-- Errors, Avisos, Infos, Dicas
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- Color Highlighter
	use({ "norcalli/nvim-colorizer.lua" })
end)
