return require('packer').startup(function()
	vim.cmd([[
	  augroup packer_user_config
	    autocmd!
	    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
	    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	  augroup end
	]])

	-- Manage the package magager
	use 'wbthomason/packer.nvim'
	
	-- Theme Plugin
	use {'folke/tokyonight.nvim', config="require('config.theme')"}

	--That nice modeline at the bottom
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	  config="require('config.lualine')"
	}

	-- ...and the bufferline at the top
	use { 
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config="require('config.topline')"
	}

	-- A nice filebrowser
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
	    config = "require('config.tree')"
	}

	-- A fuzzyfinder
	use 'liuchengxu/vim-clap'

	-- Dashboard Plugin
	use {'glepnir/dashboard-nvim', config="require('config.dashboard')"}

	-- Sneak
	use 'justinmk/vim-sneak'

	-- Git commands for nvim.
	use 'tpope/vim-fugitive' 
	
	-- Use "gc" to comment lines in visual mode. Similarly to cmd+/ in other editors.
        use 'tpope/vim-commentary' 

	-- A great tool for adding, removing and changing braces, brackets, quotes and various tags around your text.
        use 'tpope/vim-surround' 

	-- I want to see my hotkey trees
	use {'folke/which-key.nvim', config="require('config.which-key')"}

        use { 'neovim/nvim-lspconfig', config="require('config.lsp')" }
end)
