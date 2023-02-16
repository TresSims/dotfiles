local picker = require("window-picker")

require("which-key").setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

local wk = require("which-key")
wk.register({
	["<CR>"] = { "@q", "macro q" }, -- setting a special key
	[":"] = { "<Cmd>Telescope commands<CR>", "Search Commands" },
	b = {
		name = "Buffer",
		["0"] = { "<Plug>(cokeline-focus-0)", "Go To Buffer 0" },
		["1"] = { "<Plug>(cokeline-focus-1)", "Go To Buffer 1" },
		["2"] = { "<Plug>(cokeline-focus-2)", "Go To Buffer 2" },
		["3"] = { "<Plug>(cokeline-focus-3)", "Go To Buffer 3" },
		["4"] = { "<Plug>(cokeline-focus-4)", "Go To Buffer 4" },
		["5"] = { "<Plug>(cokeline-focus-5)", "Go To Buffer 5" },
		["6"] = { "<Plug>(cokeline-focus-6)", "Go To Buffer 6" },
		["7"] = { "<Plug>(cokeline-focus-7)", "Go To Buffer 7" },
		["8"] = { "<Plug>(cokeline-focus-8)", "Go To Buffer 8" },
		["9"] = { "<Plug>(cokeline-focus-9)", "Go To Buffer 9" },
		n = { "<Plug>(cokeline-focus-next)", "Next Buffer" },
		p = { "<Plug>(cokeline-focus-prev)", "Previous Buffer" },
		c = { ":bn<CR>:bw#<CR>", "Close Buffer" },
		C = { "<Plug>(cokeline-pick-close)", "Pick and close buffer" },
		b = { "<Cmd>Telescope buffers<CR>", "Search Buffers" },
		s = { "<Cmd>Telescope current_buffer_fizzy_find<CR>", "Search Inside Buffer" },
		f = { ":Format<CR>", "format" },
	},
	c = {
		name = "Create",
		n = "File",
	},
	d = {
		name = "Diagnostics",
		N = { "<Cmd>lua vim.diagnostic.goto_prev()<CR>", "Goto Previous" },
		n = { "<Cmd>lua vim.diagnostic.goto_next()<CR>", "Goto Next" },
		s = { "<Cmd>Telescope diagnostics<CR>", "Search" },
	},
	f = {
		name = "Find",
		b = { "<Cmd>Telescope buffers<CR>", "Buffers" },
		m = { "<Cmd>Telescope marks<CR>", "Mark" },
		f = { "<Cmd>Telescope file_browser<CR>", "Files" },
		h = { "<Cmd>Telescope oldfiles<CR>", "File from History" },
		s = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Search Buffer" },
		y = { "<Cmd>Telescope registers<CR>", "Yanks" },
		d = { "<Cmd>Telescope diagnostics<CR>", "Diagnostics" },
		p = { "<Cmd>Telescope project<CR>", "Projects" },
	},
	h = {
		name = "help",
		l = { ":LspInfo<CR>", "lsp" },
	},
	l = {
		name = "lsp",
		h = { ":LspInfo<CR>", "Help" },
		i = { ":LspInstall<CR>", "Install" },
		s = { ":LspStart<CR>", "Start" },
		f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
	},
	s = {
		name = "Session",
		s = { "<Cmd>:SSave<Cr>", "Save" },
		l = { "<Cmd>:SLoad<Cr>", "Load" },
		d = { "<Cmd>:SDelete<Cr>", "Delete" },
		c = { "<Cmd>:SClose<Cr>", "Close" },
	},
	t = {
		name = "Tree",
		t = { "<Cmd>:NvimTreeToggle<Cr>", "Toggle" },
	},
	w = {
		name = "Window",
		c = { ":hide<CR>", "Close" },
		j = { "<C-W>j", "Down" },
		h = { "<C-W>h", "Left" },
		k = { "<C-W>k", "Up" },
		l = { "<C-W>l", "Down" },
		w = { "<C-W>w", "Other Window" },
		["|"] = { ":vsp<Cr>", "Split" },
		["-"] = { ":sp<Cr>", "Split" },
	},
	p = {
		name = "Pick",
		w = {
			function()
				local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
				vim.api.nvim_set_current_win(picked_window_id)
			end,
			"window",
		},
		b = { "<Plug>(cokeline-pick-focus)", "buffer" },
	},
}, { prefix = "<leader>" })

wk.register({
	t = { ":bn<CR>", "Next Buffer" },
	T = { ":bp<CR>", "Next Buffer" },
}, { prefix = "g" })

vim.cmd([[set timeoutlen=250]])
