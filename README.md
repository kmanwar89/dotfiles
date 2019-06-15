### Summary
Dotfiles and other configuration files for i3wm installation on Dell Inspiron 15-5547 Laptop (on metal) running Arch Linux

Wiki will eventually be populated and include detailed steps on how I set up my hardware, fixed various UI/UX issues, configured i3 for basic usage and "riced" my system.


# dotfiles

Config & Dotfiles for i3 setup on Dell Inspiron 15-5547 Laptop

Detailed [Wiki](https://github.com/kmanwar89/i3/wiki) outlining how I perfected my setup, and chronicling my journey with i3 and ArchLinux.

# 3 JUNE 2019
This folder is located at ~/.i3 and contains dotfiles. The point of making the hidden directory is just to make it out of sight, out of mind. Explicit references to this directory are written in various configuration files.

This folder can then be backed up and restored from as part of the dotfiles on the Github repo.


### Setup
arch_install.sh - used to install base Arch system with some tweaks specific to my Laptop
link.sh - used to symlink all relevant dotfiles between the ~/dotfiles directory and their relevant location. This way, I only ever make changes in ~/dotfiles, and everything stays organized and updated. Backing up is also every convenient
asdf