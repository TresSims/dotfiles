-- configure folds
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- Check if LSP supports folding
		if client.server_capabilities.foldingRangeProvider then
			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
		else
			-- Fall back to treesitter if available
			local has_ts, _ = pcall(require, "nvim-treesitter")
			if has_ts then
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
			end
		end

		vim.wo.foldlevel = 99 -- Start with all folds open
	end,
})

-- Set up treesitter folding for buffers where LSP doesn't attach
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		-- Wait a bit for LSP to potentially attach
		vim.defer_fn(function()
			local bufnr = vim.api.nvim_get_current_buf()
			local clients = vim.lsp.get_clients({ bufnr = bufnr })

			-- Only set treesitter if no LSP with folding is attached
			local has_lsp_folding = false
			for _, client in ipairs(clients) do
				if client.server_capabilities.foldingRangeProvider then
					has_lsp_folding = true
					break
				end
			end

			if not has_lsp_folding then
				local has_ts, _ = pcall(require, "nvim-treesitter")
				if has_ts then
					vim.wo.foldmethod = "expr"
					vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
					vim.wo.foldlevel = 99
				end
			end
		end, 100)
	end,
})
