local wk = require("which-key")

-- stylua: ignore
wk.add({
	-- Buffers
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bj", ":bnext<CR>", desc = "Go to next Buffer" },
	{ "<leader>bk", ":bprevious<CR>", desc = "Go to previous Buffer" },
	{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
	{ "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers", },

	-- Code
	{ "<leader>c", group = "Code" },
  { "<leader>cd", vim.diagnostic.open_float,  desc = "Line Diagnostics" },

  -- Debug
  { "<leader>d", group = "Debug" },

  -- find
  { "<leader>f", group = "Find" },

	-- Git
	{ "<leader>g", group = "Git" },

	-- Marks
	{ "<leader>m", group = "Marks" },
	{ "<leader>mD", "<cmd>delm a-zA-Z<cr>", desc = "Delete all marks" },
	{ "<leader>md", ":execute 'delmarks '.nr2char(getchar())<cr>", desc = "Delete input mark" },

	-- New
	{ "<leader>n", group = "Notifications" },
  --
  -- Persistance
  { "<leader>p", group = "Sessions" },

	-- Search
	{ "<leader>s", group = "Search" },
	{ "<leader>su", ":UndotreeToggle<CR>", desc = "Undo Tree" },

	-- Windows
	{ "<leader>w", group = "Window" },
	{ "<leader>wj", "<C-W>j", desc = "Go to the down window" },
	{ "<leader>wh", "<C-W>h", desc = "Go to the left window" },
	{ "<leader>wk", "<C-W>k", desc = "Go to the up window" },
	{ "<leader>wl", "<C-W>l", desc = "Go to the right window" },
	{ "<leader>w-", "<C-W>s", desc = "Split window horizontally" },
	{ "<leader>w|", "<C-W>v", desc = "Split window vertically" },
	{ "<leader>wd", "<C-W>q", desc = "Delete window" },

	-- Diagnostics
	{ "<leader>x", group = "diagnostics" },

	-- Tabs
	{ "<leader><tab>", "Tab Pages" },
	{ "<leader><tab>j", ":tabn<CR>", desc = "Go to next tabpage" },
	{ "<leader><tab>k", ":tabp<CR>", desc = "Go to previous tabpage" },
})
