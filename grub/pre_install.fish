#! /usr/bin/fish

sudo rm -rf /boot/grub/themes/tokyo-night
sudo ln -s $PUNCTUAL_PACKAGE_DIR/grub/tokyo-night-grub/tokyo-night /boot/grub/themes
