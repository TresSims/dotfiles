# Muh Dotfiles

My personal dotfiles repo - managed with [chezmoi](https://www.chezmoi.io/). 

I use [Arch](https://archlinux.org/) (BTW) with the [yay](https://github.com/Jguer/yay) package manager. Both are required If you're interested in checking this out without serious modifications.
I also use vault to store my Fish Variables, since they someimtes contain secrets. Because of this, if you want to use these dotfiles I reccomend moving the `.tmpl` files and the `run` scripts from the root directory.

If you have a blank Arch install and want to set up your system though (or you're me and want a script to run after setting up a new computer) Try this:

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
chezmoi init --apply https://github.com/tressims/dotfiles.git
```
