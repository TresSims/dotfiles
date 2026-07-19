vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			terraform = { lsp_format = "prefer" },
			go = { lsp_format = "prefer" },
			yaml = { lsp_format = "prefer" },
		},
	},
}
