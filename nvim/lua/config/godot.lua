vim.cmd([[
func! GodotSettings() abort
        setlocal tabstop=4
        set expandtab
endfunc
augroup godo | au!
        au FileType gdscript call GodotSettings()
augroup end
]])
