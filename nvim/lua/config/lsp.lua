-- LSP installer setup
require("nvim-lsp-installer").setup {
        automatic_installation = true
}

-- Enable LSP
local lspconfig = require('lspconfig')

-- lspconfig.tailwindcss.setup { }
-- lspconfig.eslint.setup { }
-- lspconfig.jsonls.setup { }
-- lspconfig.vuels.setup { }

lspconfig.sourcery.setup{}
lspconfig.gopls.setup{}
lspconfig.clangd.setup{}
lspconfig.sumneko_lua.setup {}

lspconfig.lemminx.setup{
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
