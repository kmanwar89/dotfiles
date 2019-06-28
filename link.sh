#! /bin/bash

# Purpose: The purpose of this script is to autmoagically symlink and move relevant files from the dotfiles Github repo to their requisite folder 
# on a new i3 installation on ArchLinux
# Author: Kadar Anwar
# Date: 26 JUNE 2019
# Version 1.0 - Initial

# i3 config file first
cp ~/dotfiles/i3/config ~/.config/i3/
echo "i3 config copied!"
sleep 5

# pacman.conf
cp ~/dotfiles/etc/pacman.conf /etc/ 
echo "pacman configuration file copied"
sleep 5

# files in ~ (bashrc, bash_aliases, bashrc)
cp ~/dotfiles/home/.bash_aliases ~/
cp ~/dotfiles/home/.bashrc ~/
cp ~/dotfile/home/.bash_aliases ~/
echo "Files in home directory copied!"
sleep 5

# pictures for wallpaper
cp -r ~/dotfiles/Pictures/ ~/
echo "Pictures/Wallpapers copied!"
sleep 5

# files in /boot
cp ~/dotfiles/rEFInd/boot/intel-ucode.img /boot
cp ~/dotfiles/rEFInd/boot/refind_linux.conf /boot
echo "/boot files copied!"
sleep 5

# files for rEFInd
cp ~/dotfiles/rEFInd/efi/refind.conf /efi/EFI/refind/
echo "rEFInd files copied!"
sleep 5

# bash powerline
cp ~/dotfiles/scripts/bash-powerline/.bash-powerline.sh ~
echo -e '\nsource ~/.bash_powerline.sh'
echo "bash powerline files copied!"
sleep 5

# files in home directory
cp ~/dotfiles/home/.bash_aliases ~/
cp ~/dotfiles/home/.bashrc ~/
echo "files for home directory copied!"
sleep 5
