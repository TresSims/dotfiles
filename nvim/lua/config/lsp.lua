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
