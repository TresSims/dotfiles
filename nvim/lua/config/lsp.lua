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

vim.cmd([[ 
        augroup coq-start
                autocmd!
                au bufEnter * :COQnow --shut-up
        augroup END
]])
