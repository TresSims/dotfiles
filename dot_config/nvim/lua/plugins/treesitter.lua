return {
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		event = { "LazyFile", "VeryLazy" },
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
				"javascript",
				"hcl",
				"terraform",
			},
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter")

			-- setup treesitter
			TS.setup(opts)
			Util.treesitter.get_installed(true)

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
						vim.opt.indentexpr = Util.treesitter.have(nil, "indents")
								and "v:lua.vim.require'nvim-treesitter'.indentexpr()"
							or -1
					end

					-- folds
					if enabled("folds", "folds") then
						vim.opt.foldexpr = Util.treesitter.have(nil, "folds") and "v:lua.vim.treesitter.foldexpr()"
							or "0"
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = "VeryLazy",
		opts = {
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				-- LazyVim extention to create buffer-local keymaps
				keys = {
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
			},
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter-textobjects")
			TS.setup(opts)

			local function attach(buf)
				local ft = vim.bo[buf].filetype
				if not (vim.tbl_get(opts, "move", "enable") and Util.treesitter.have(ft, "textobjects")) then
					return
				end
				---@type table<string, table<string, string>>
				local moves = vim.tbl_get(opts, "move", "keys") or {}

				for method, keymaps in pairs(moves) do
					for key, query in pairs(keymaps) do
						local queries = type(query) == "table" and query or { query }
						local parts = {}
						for _, q in ipairs(queries) do
							local part = q:gsub("@", ""):gsub("%..*", "")
							part = part:sub(1, 1):upper() .. part:sub(2)
							table.insert(parts, part)
						end
						local desc = table.concat(parts, " or ")
						desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
						desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")
						if not (vim.wo.diff and key:find("[cC]")) then
							vim.keymap.set({ "n", "x", "o" }, key, function()
								require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
							end, {
								buffer = buf,
								desc = desc,
								silent = true,
							})
						end
					end
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("lazyvim_treesitter_textobjects", { clear = true }),
				callback = function(ev)
					attach(ev.buf)
				end,
			})
			vim.tbl_map(attach, vim.api.nvim_list_bufs())
		end,
	},
}
