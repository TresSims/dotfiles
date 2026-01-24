return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
	},
	config = function()
		require("nvim-tree").setup({})
	end,
}
