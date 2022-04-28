#! /usr/bin/fish

yay -S --noconfirm neovim_git

bash -c 'git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim'
