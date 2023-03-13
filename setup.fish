#! /usr/bin/fish

# Set package dir
set -Ux PUNCTUAL_PACKAGE_DIR (dirname (status --current-filename))

# Install aur helper
while read --nchars 1 -l response --prompt-str="Do you want to install Yay? y/(n) "
                or return 1
        switch $response
                case y Y
                        echo "Installing Yay..."
                        pacman -S --needed --noconfirm git
                        git clone https://aur.archlinux.org/yay.git
                        cd yay
                        makepkg -si
                        cd ..
                        rm -rf yay
                        echo "Done"
                        break
                case '*'
                        echo "Skipping step"
                        break
        end
end

# Install all packages
cd $PUNCTUAL_PACKAGE_DIR

if type -f yay
        while read --nchars 1 -l response --prompt-str="Do you want to install my default packages? y/(n)"
                        or return 1
                switch $response
                        case y Y
                                yay -S --needed --noconfirm - < .packages
                                asdf plugin add nodejs
                                asdf install nodejs latest
                                asdf global nodejs latest
                                asdf reshim nodejs

                                npm install -g yarn
                                asdf reshim nodejs
                                break
                        case '*'
                                echo "Skipping step"
                                break
                end
        end
end


# Install packages
while read --nchars 1 -l response --prompt-str="Do you want to initialize the submodules? y/(n)"
                or return 1
        switch $response
                case y Y
                        git submodule init
                        git submodule update
                        break
                case '*'
                        echo "Skipping this step"
                        break
        end
end

pcl install . --force
