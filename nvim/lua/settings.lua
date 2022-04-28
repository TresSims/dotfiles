-- Leader/local leader
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

vim.opt.termguicolors = true

-- Don't persist hilights after search
vim.o.hlsearch = false

-- Line number settings
vim.wo.number = true
vim.wo.relativenumber = true

-- Save undo history
vim.opt.undofile = true

-- Case sensitive search
vim.o.ignorecase = true
vim.o.smartcase = true


-- Hilight when copy
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

vim.cmd[[set expandtab]] -- Use whitespace instead of tabs
vim.cmd[[set cc=88]] -- Let me know how long my lines should be
vim.cmd[[set cursorline]] -- Highlight my current line
vim.cmd[[set clipboard=unnamedplus]] -- Use system clipbord
vim.cmd[[set backupdir=~/.config/nvim/backups]] -- Keep backups
vim.cmd[[set backupdir=~/.config/nvim/backups]] -- Keep backups
vim.cmd[[set nowrap]] -- Truncate long lines

-- Set up some of my less common file types
vim.cmd([[au BufRead,BufNewFile *.model set filetype=xml]]) -- 3MF .model files
vim.cmd([[au BufRead,BufNewFile *.gs set filetype=javascript]]) -- Google AppScript files

vim.cmd([[au BufRead,BufNewFile *.hbs set filetype=html]]) -- Handlebars Templating Language
