# Preamble

This repo contains the dotfiles that I daily drive and are updated as I make changes.

A general warning for installing these dotfiles as described below, they will
OVERWRITE anything you are currently using, and if you have any custom settings, it is
probably best to make sure you have created backups before running this.

# Installing the dotfiles

## Using Setup.Fish

This script does a number of things currently:

* Sets the semi-required `PUNCTUAL_PACKAGE_DIR` variable.
* Installs `yay` for managing packages from the AUR
* Installs all packages that I need on my computer, from the `packages` list
* Initializes the submodules in this repository

To run the script, first make sure it is executable
`chmod +x ./setup.fish`

Then run
`./setup.fish`
and follow the prompts.

This script is designed to set up my computer from scratch for a fresh install, while it
may be useful to you, you probably don't want to try and install all my packages.

If you do not install all of these packages, you will at least need to install  [Punctual](https://github.com/ariataylor90/punctual)
to use this script.

## Using Punctual
If you don't want to use the setup script, you can mix and match any of these scripts using
[Punctual](https://github.com/ariataylor90/punctual).

Basically it creates symlinks between the files
here to where they should be on your file system

`pip install punctual`

To install ALL packages with punctual, run:

`pcl install . --force`
Warning
: This deletes any existing files without backing them up, make any backups you want
before running these commands


To install the dotfiles for a specific app, e.g. nvim, run:

`pcl install nvim --force`

Using this method, you will want to use the name of the folder to sepcify which module
to install. If you don't like any of these methods, you can copy and paste these files
manually.

# Post installation setup
There are still some packages that must be configured using command line
tools or GUI's. This includes:

* Setting GTK theme, including:
    * TokyoNight Application theme
    * Layan Cursor theme
    * Candy icon theme
    * Houdini theme
    * Blender theme
    * Grub

I am in the process of adding readme's for how to do manual installation for all of the
dotfiles, but in the meantime, feel free to reach out for help.
