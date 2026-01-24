return {
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
			ensure_installed = {
				"bash",
				"lua",
				"python",
				"vim",
				"yaml",
				"json",
				"go",
			},
		},
	},
}
