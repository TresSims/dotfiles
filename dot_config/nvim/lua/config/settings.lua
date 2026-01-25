local opt = vim.opt

opt.undofile = true
opt.autowrite = true
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.foldtext = ""
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undolevels = 10000
opt.wrap = false
opt.cc = "88"
opt.backupdir = "/home/tsims/.config/nvim/backups"
opt.wrap = false
opt.nu = true
opt.relativenumber = true

-- Set filetypes for uncommon files
vim.cmd([[au BufRead,BufNewFile *.model set filetype=xml]]) -- 3MF .model files
vim.cmd([[au BufRead,BufNewFile *.gs set filetype=javascript]]) -- Google AppScript files
