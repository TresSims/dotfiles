return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"helm",
				"yaml",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		helm_ls = {},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				yaml = { "yamllint" },
			},
		},
	},
	{
		"qvalentin/helm-ls.nvim",
		ft = "helm",
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				yaml = { lsp_format = "prefer" },
			},
		},
	},
}
