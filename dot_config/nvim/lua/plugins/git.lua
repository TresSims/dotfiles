return {
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>g", group = "git" },
			{ "<leader>ga", "<cmd>G add .<cr>", desc = "add" },
			{ "<leader>gC", ":G commit -m ", desc = "commit" },
			{ "<leader>gp", "<cmd>G push<cr>", desc = "push" },
			{ "<leader>gP", "<cmd>G push -f<cr>", desc = "force push" },
			{ "<leader>gr", ":G rebase ", desc = "rebase" },
			{ "<leader>gf", "<cmd>G fetch<cr>", desc = "fetch" },
			{ "<leader>gv", "<cmd>G pull<cr>", desc = "pull" },
			{ "<leader>gb", "<cmd>G branch<cr>", desc = "branch" },
			{ "<leader>gB", ":G checkout -b ", desc = "new branch" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
