return {
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
			ensure_installed = {
				"bash",
				"lua",
				"python",
				"vim",
				"yaml",
				"json",
				"go",
			},
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter")

			-- setup treesitter
			TS.setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("lazyvim_treesitter", { clear = true }),
				callback = function(ev)
					local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
					if not Util.treesitter.have(ft) then
						return
					end

					local function enabled(feat, query)
						local f = opts[feat] or {}
						return f.enable ~= false
							and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
							and Util.treesitter.have(ft, query)
					end

					-- highlighting
					if enabled("highlight", "highlights") then
						pcall(vim.treesitter.start, ev.buf)
					end

					-- indents
					if enabled("indent", "indents") then
						vim.opt.indentexpr = Util.treesitter.have(nil, "indents") and TS.indentexpr() or -1
					end

					-- folds
					if enabled("folds", "folds") then
						vim.opt.foldexpr = Util.treesitter.have(nil, "folds") and vim.treesitter.foldexpr() or "0"
					end
				end,
			})
		end,
	},
}
