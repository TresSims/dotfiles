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

        -- a startscreen
        use {
                'mhinz/vim-startify',
                config = "require('config.dashboard')"
        }

	-- Telescope ecosystem
        use {
          'nvim-telescope/telescope.nvim',
          requires =  'nvim-lua/plenary.nvim', 
          config="require('config.telescope')"
        }
        use 'nvim-telescope/telescope-ui-select.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'nvim-telescope/telescope-project.nvim'

        -- Treesitter
	use {'nvim-treesitter/nvim-treesitter', config="require('config.treesitter')"}
        
        -- lsp
	use {'neovim/nvim-lspconfig', config="require('config.lsp')"}

        -- autocompletion
        use { 'ms-jpq/coq_nvim', requires='ms-jpq/coq.artifacts' }

        -- Hilight the stuff under my cursor
	use {'yamatsum/nvim-cursorline', config="require('config.cursorline')"}

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
end)
