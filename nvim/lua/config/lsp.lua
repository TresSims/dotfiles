-- LSP installer setup
require("nvim-lsp-installer").setup {}

-- Enable LSP
require'lspconfig'.pyright.setup{} -- python
require'lspconfig'.gopls.setup{} -- go
require'lspconfig'.sumneko_lua.setup{} -- lua
require'lspconfig'.clangd.setup{} -- C

require'lspconfig'.lemminx.setup{ --xml
        settings = {
                filetypes = {
                        "model"
                }
        }
}

-- Set up CoQ
vim.cmd([[ 
        augroup coq-start
                autocmd!
                au bufEnter * :COQnow --shut-up
        augroup END
]])


-- Set up diagnostic settings
vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 1500
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
