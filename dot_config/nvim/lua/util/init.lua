local M = {}

M.root = require("util.root")

M.ui = require("util.ui")

M.treesitter = require("util.treesitter")

M.cmp = require("util.cmp")

M.CREATE_UNDO = vim.api.nvim_replace_termcodes("<c-G>u", true, true, true)
function M.create_undo()
	if vim.api.nvim_get_mode() == "i" then
		vim.api.nvim_feedkeys(M.CREATE_UNDO, "n", false)
	end
end

return M
