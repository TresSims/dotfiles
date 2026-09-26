return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"go",
				"gomod",
				"gowork",
				"gosum",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {},
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"goimports",
				"golangci-lint",
				"delve",
				"gopls",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				go = { "golangcilint" },
			},
		},
	},
	{
		"stevear/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = {
					lsp_format = "prefer",
					"goimports",
				},
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
		},
		opts = {
			adapters = {
				["neotest-go"] = {
					recursive_run = true,
				},
			},
		},
	},
}
