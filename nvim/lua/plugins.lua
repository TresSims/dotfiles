return require('packer').startup(function()
        vim.cmd([[
	  augroup packer_user_config
	    autocmd!
	    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
	    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	  augroup end
	]]      )
        -- Manage the package magager
        use 'wbthomason/packer.nvim'

        -- start up faster
        use 'lewis6991/impatient.nvim'
        use 'nathom/filetype.nvim'

        -- a startscreen
        use {
                'mhinz/vim-startify',
                config = "require('config.dashboard')"
        }

        -- Theme Plugin
        use { 'folke/tokyonight.nvim', config = "require('config.theme')" }

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', config = "require('config.treesitter')" }
        use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }

        -- Telescope ecosystem
        use {
                'nvim-telescope/telescope.nvim',
                requires = {
                        { 'nvim-lua/plenary.nvim' }
                }
        }
        use {
                'nvim-telescope/telescope-file-browser.nvim',
                requires = {
                        { 'nvim-telescope/telescope.nvim' }
                },
                config = "require('config.telescope')"
        }

        --That nice modeline at the bottom
        use {
                'nvim-lualine/lualine.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true },
                config = "require('config.lualine')"
        }

        -- ...and the bufferline at the top
        use {
                'akinsho/bufferline.nvim',
                requires = 'kyazdani42/nvim-web-devicons',
                config = "require('config.topline')"
        }

        -- A nice tree
        use {
                'kyazdani42/nvim-tree.lua',
                requires = {
                        'kyazdani42/nvim-web-devicons'
                },
                config = "require('config.tree')"
        }

        -- lsp
        use {
                'neovim/nvim-lspconfig',
                config = "require('config.lsp')"
        }

        use {
                'sbdchd/neoformat',
                config = "require('config.formatting')"
        }

        -- autocompletion
        use { 'ms-jpq/coq_nvim', requires = 'ms-jpq/coq.artifacts' }

        -- Map my indent levels
        use { 'lukas-reineke/indent-blankline.nvim' }

        -- Underline the stuff under my cursor
        use { 'yamatsum/nvim-cursorline', config = "require('config.cursorline')" }

        -- Sneak
        use 'justinmk/vim-sneak'

        -- Git commands for nvim.
        use 'tpope/vim-fugitive'

        -- Comment plugins
        use 'tpope/vim-commentary'

        -- A great tool for adding, removing and changing braces, brackets, quotes and various tags around your text.
        use 'tpope/vim-surround'

        -- I want to see my hotkey trees
        use { 'folke/which-key.nvim', config = "require('config.which-key')" }
end)
