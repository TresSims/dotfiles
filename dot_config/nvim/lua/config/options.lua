-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Persist undos through editor restart
vim.opt.undofile = true

-- Case Sensitive Search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd([[set expandtab]]) -- Use spaces, not tabs
vim.cmd([[set cc=88]]) -- View line marker on column 88
vim.cmd([[set clipboard=unnamedplus]]) -- Use system clipboard
vim.cmd([[set backupdir=~/.config/nvim/backups]]) -- Keep backups
vim.cmd([[set nowrap]]) -- Don't word wrap

-- Set filetypes for uncommon files
vim.cmd([[au BufRead,BufNewFile *.model set filetype=xml]]) -- 3MF .model files
vim.cmd([[au BufRead,BufNewFile *.gs set filetype=javascript]]) -- Google AppScript files
