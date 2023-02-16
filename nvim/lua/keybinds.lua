-- Move lines or visual block
vim.cmd([[nnoremap <A-j> <Esc>:m .+1<CR>]])
vim.cmd([[nnoremap <A-k> <Esc>:m .-2<CR>]])
vim.cmd([[inoremap <A-j> <Esc>:m .+1<CR>]])
vim.cmd([[inoremap <A-k> <Esc>:m .-2<CR>]])
vim.cmd([[vnoremap <A-j> :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap <A-k> :m '<-2<CR>gv=gv]])

-- One key navigate windows
vim.cmd([[:tnoremap <C-h> <C-\><C-N><C-w>h]])
vim.cmd([[:tnoremap <C-j> <C-\><C-N><C-w>j]])
vim.cmd([[:tnoremap <C-k> <C-\><C-N><C-w>k]])
vim.cmd([[:tnoremap <C-l> <C-\><C-N><C-w>l]])
vim.cmd([[:inoremap <C-h> <C-\><C-N><C-w>h]])
vim.cmd([[:inoremap <C-j> <C-\><C-N><C-w>j]])
vim.cmd([[:inoremap <C-k> <C-\><C-N><C-w>k]])
vim.cmd([[:inoremap <C-l> <C-\><C-N><C-w>l]])
vim.cmd([[:nnoremap <C-h> <C-w>h]])
vim.cmd([[:nnoremap <C-j> <C-w>j]])
vim.cmd([[:nnoremap <C-k> <C-w>k]])
vim.cmd([[:nnoremap <C-l> <C-w>l]])

-- exit terminal mode
vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])
