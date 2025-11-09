#! /usr/bin/fish

if not test -e /usr/share/sddm/themes/sddm-astronaut-theme
    sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
    sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
end

sudo sed -i 's/ConfigFile=.*/ConfigFile=Themes\/black_hole.conf/' /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
