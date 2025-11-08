-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local wk = require("which-key")
wk.add({
  { "<leader>n", group = "New" },

  -- Additional buffer navigation
  { "<leader>bj", ":bnext<CR>", desc = "Go to next Buffer" },
  { "<leader>bk", ":bprevious<CR>", desc = "Go to previous Buffer" },
  { "<leader>wj", "<C-W>j", desc = "Go to the down window" },
  { "<leader>wh", "<C-W>h", desc = "Go to the left window" },
  { "<leader>wk", "<C-W>k", desc = "Go to the up window" },
  { "<leader>wl", "<C-W>l", desc = "Go to the right window" },

  -- Marks
  { "<leader>m", group = "Marks" },
  { "<leader>md", "<cmd>delm a-zA-Z<cr>", desc = "Delete all marks" },
  { "<leader>md", ":execute 'delmarks '.nr2char(getchar())<cr>", desc = "Delete input mark" },

  -- Searches
  { "<leader>su", ":UndotreeToggle<CR>", desc = "Undo Tree" },

  -- Tabs
  { "<leader><tab>j", ":tabn<CR>", desc = "Go to next tabpage" },
  { "<leader><tab>k", ":tabp<CR>", desc = "Go to previous tabpage" },
})
