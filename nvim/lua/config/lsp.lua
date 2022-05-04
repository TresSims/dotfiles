-- Python LSP
require'lspconfig'.pyright.setup{}

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
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
