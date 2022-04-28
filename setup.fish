#! /usr/bin/fish

# Set package dir
set -Ux PUNCTUAL_PACKAGE_DIR (dirname (status --current-filename))

# Install aur helper
pacman -S --needed --noconfirm git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install all packages
cd $PUNCTUAL_PACKAGE_DIR
pacman -S --needed --noconfirm - < .packages

asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest
asdf reshim nodejs

npm install -g yarn
asdf reshim nodejs

npm install -g @tailwindcss/language-server
npm install -g vscode-langservers-extracted

cargo add stylua

# Install packages
pcl install . --force
