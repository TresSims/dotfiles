vim.cmd([[
augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
augroup END
]]
)
