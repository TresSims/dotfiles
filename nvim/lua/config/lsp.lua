require('lspconfig').pylsp.setup {}
require('lspconfig').gopls.setup {}
require('lspconfig').clangd.setup {}
require('lspconfig').lemminx.setup {}
require('lspconfig').eslint.setup {}

require('lspconfig').sumneko_lua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
                Lua = {
                        runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                                -- Setup your lua path
                                path = runtime_path,
                        },
                        diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                        },
                        workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file('', true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                                enable = false,
                        },
                },
        },
}

-- lspconfig.tailwindcss.setup { }
-- lspconfig.jsonls.setup { }
-- lspconfig.vuels.setup { }

-- Set up CoQ
vim.cmd([[ 
        augroup coq-start
                autocmd!
                au bufEnter * :COQnow --shut-up
        augroup END
]])

vim.cmd([[
augroup fmt
        autocmd!
        autocmd BufWritePre * lua vim.lsp.buf.formatting()
augroup END
]]
)

-- Set up diagnostic settings
vim.diagnostic.config({
        virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 1500
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
