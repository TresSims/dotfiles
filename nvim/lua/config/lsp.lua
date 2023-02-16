require("lspconfig").pylsp.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").gdscript.setup({})
require("lspconfig").clangd.setup({})

require("lspconfig").arduino_language_server.setup({
	cmd = {
		"clangd",
		"-cli-daemon-addr",
		"'127.0.0.1:50051'",
		"-cli-daemon-instance",
		"0",
		"-clangd",
		"/usr/bin/clangd",
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").jsonls.setup({
	capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
require("lspconfig").lemminx.setup({})

require("lspconfig").cssls.setup({})

require("lspconfig").tailwindcss.setup({})

-- Set up diagnostic settings
vim.diagnostic.config({
	virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 1000
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
