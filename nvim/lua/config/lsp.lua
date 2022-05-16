-- Python LSP
require'lspconfig'.pyright.setup{}
require'lspconfig'.gopls.setup{}

-- XML Lsp
require'lspconfig'.lemminx.setup{
        settings = {
                filetypes = {
                        "model"
                }
        }
}

-- cpp LSP
require'lspconfig'.clangd.setup{}

vim.cmd([[ 
        augroup coq-start
                autocmd!
                au bufEnter * :COQnow --shut-up
        augroup END
]])

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 1500
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
