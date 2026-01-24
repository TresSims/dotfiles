local M = {}

function M.get()
	-- Try to find .git directory
	local git_root = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";")
	if git_root ~= "" then
		return vim.fn.fnamemodify(git_root, ":h")
	end

	-- Try to get LSP root
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
	if #clients > 0 then
		local lsp_root = clients[1].config.root_dir
		if lsp_root then
			return lsp_root
		end
	end

	-- Fall back to current working directory
	return vim.fn.getcwd()
end

return M
