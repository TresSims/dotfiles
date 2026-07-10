return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"esmuellert/codediff.nvim", -- optional

		"ibhagwan/fzf-lua", -- optional
		"nvim-mini/mini.pick", -- optional
		"folke/snacks.nvim", -- optional
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
