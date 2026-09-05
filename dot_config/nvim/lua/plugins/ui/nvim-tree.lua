return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
	},
	opts = {
		actions = {
			open_file = {
				window_picker = {
					chars = "asdfjkl;",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "NvimTree",
			callback = function()
				vim.schedule(function()
					local api = require("nvim-tree.api")
					api.tree.change_root(Util.root.get())
				end)
			end,
		})
	end,
}
