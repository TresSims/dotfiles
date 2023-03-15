return require("packer").startup(function()
	-- Run packer updates when plugin page is edited
	vim.cmd([[
	  augroup packer_user_config
	    autocmd!
	    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
	    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	  augroup end
	]])
	-- Manage the package magager
	use("wbthomason/packer.nvim")

	-- Install non-vim package things
	use({
		"williamboman/mason.nvim",
		config = "require('config.mason')",
	})

	use({ "williamboman/mason-lspconfig.nvim", config = "require('config.mason-lsp')" })

	-- start up faster
	use("lewis6991/impatient.nvim")

	-- icons
	use({ "nvim-tree/nvim-web-devicons" })

	-- a startscreen
	use({
		"mhinz/vim-startify",
		config = "require('config.dashboard')",
	})

	-- Theme Plugin
	use({ "folke/tokyonight.nvim", config = "require('config.theme')" })

	-- Treesitter, at least does some folding for us
	use({ "nvim-treesitter/nvim-treesitter", config = "require('config.treesitter')" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = { "nvim-treesitter" } })

	-- Telescope ecosystem
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = "require('config.telescope')",
	})

	-- colorize hex codes
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer').setup()" })

	--That nice modeline at the bottom
	use({
		"nvim-lualine/lualine.nvim",
		config = "require('config.lualine')",
	})

	-- bufferline at the top
	use({
		"noib3/nvim-cokeline",
		config = "require('config.bufferline')",
	})

	-- pick windows
	use({
		"s1n7ax/nvim-window-picker",
		tag = "v1.*",
		config = "require('config.window-picker')",
	})

	-- A nice tree
	use({
		"nvim-tree/nvim-tree.lua",
		config = "require('config.tree')",
	})

	-- lsp
	use({
		"neovim/nvim-lspconfig",
		config = "require('config.lsp')",
	})

	use("OmniSharp/omnisharp-vim")

	-- autocompletion
	use({ "neoclide/coc.nvim", branch = "release", config = "require('config.coc')" })

	-- formatting
	use({ "mhartington/formatter.nvim", config = "require('config.formatter')" })

	-- Map my indent levels
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Underline the stuff under my cursor
	use({ "yamatsum/nvim-cursorline", config = "require('config.cursorline')" })

	-- Sneak
	use("justinmk/vim-sneak")

	-- Git commands for nvim.
	use("tpope/vim-fugitive")

	-- Comment plugins
	use("tpope/vim-commentary")

	-- A great tool for adding, removing and changing braces, brackets, quotes and various tags around your text.
	use("tpope/vim-surround")

	-- godot setup
	use({ "habamax/vim-godot", config = "require('config.godot')" })

	-- nvim trouble
	use({ "folke/trouble.nvim", config = "require('config.trouble')" })

	-- I want to see my hotkey trees
	use({ "folke/which-key.nvim", config = "require('config.which-key')" })
end)
