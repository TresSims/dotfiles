return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			"bash",
			"fish",
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				fish = { "fish" },
			},
		},
	},
}
