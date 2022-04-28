# Preamble

This repo contains the dotfiles that I daily drive and are updated as I make changes.

A general warning for installing these dotfiles as described below, they will
OVERWRITE anything you are currently using, and if you have any custom settings, it is
probably best to make sure you have created backups before running this.

# Pre-requisites

This repo contains configurations settings for a variety of applications.
If you run the `setup.fish` file it will install all of the packages you need to get set
up after a fresh install.

## Setup.Fish
This script does a number of things currently:

* Sets the semi-required `PUNCTUAL_PACKAGE_DIR` variable.
* Installs `yay` for managing packages from the AUR
* Installs all packages that I need on my computer, from the `packages` list
* Sets up some required mods using the asdf-vm

## Submodules
Some of the themes and icon packs I use, I haven't made myself. Where possible I use
submodules to keep the themes up to date, and provide credit where it is due.

To set up the submodules run
```
git submodule init
git submodule update
```

## Punctual
I use puncual to install my dotfiles. Basically it creates symlinks between the files
here to where they should be on your file system

`pip install punctual`

Read more [here](https://github.com/ariataylor96/punctual)

# Installation
Warning
: This deletes any existing files without backing them up, make any backups you want
before running these commands

From there you can install all the packages with
`pcl install . --force`

or individually with
`pcl install <package name> --force`


After this, there are still some packages that must be configured using command line
tools or GUI's. This includes:

* Setting GTK theme, including:
    * TokyoNight Application Theme
    * Layan Cursor Theme
    * Candy icon theme

For this, I use `lxappearance`

You will also need to add the line:
`GRUB_THEME="/boot/grub/themes/tokyo-night/theme.txt"`

I decided against automatically editing any boot configs. To make sure these chagnes
get applied to your grub config, run:
`sudo grub-mkconfig -o /boot/grub/grub.cfg`

To finalize the install of the grub theme. Although there are some scripts that run with
super admin privliges, I decided it was best not to fuck with people grub configs willy
nilly.
