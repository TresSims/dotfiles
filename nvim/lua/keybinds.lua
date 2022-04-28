-- Move lines or visual block
vim.cmd[[nnoremap <A-j> <Esc>:m .+1<CR>]]
vim.cmd[[nnoremap <A-k> <Esc>:m .-2<CR>]]
vim.cmd[[inoremap <A-j> <Esc>:m .+1<CR>]]
vim.cmd[[inoremap <A-k> <Esc>:m .-2<CR>]]
vim.cmd[[vnoremap <A-j> :m '>+1<CR>gv=gv]]
vim.cmd[[vnoremap <A-k> :m '<-2<CR>gv=gv]]
