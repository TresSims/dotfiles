#! /usr/bin/fish

sudo rm -rf /usr/share/sddm/themes/multicolor-sddm-theme
sudo cp $PUNCTUAL_PACKAGE_DIR/sddm/multicolor-sddm-theme /usr/share/sddm/themes/

sudo rm /usr/lib/sddm/sddm.conf.d/default.conf
sudo ln -s $PUNCTUAL_PACKAGE_DIR/sddm/default.conf /usr/lib/sddm/sddm.conf.d/
