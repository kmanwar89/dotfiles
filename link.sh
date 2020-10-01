#! /bin/bash

# Purpose: The purpose of this script is to autmoagically symlink and move relevant files from the dotfiles Github repo to their requisite folder
# on a new i3 installation on ArchLinux
# Author: Kadar Anwar
# Date: 26 JUNE 2019
# Version 1.0 - Initial

# i3 config file first
cp /home/kadar/dotfiles/i3/config /home/kadar/.config/i3/
cp /home/kadar/dotfiles/i3/bar/top.conf /home/kadar/.config/i3/
cp /home/kadar/dotfiles/i3/bar/bottom.conf /home/kadar/.config/i3/
echo "i3 config copied!"
sleep 2

# pacman.conf
sudo cp /home/kadar/dotfiles/etc/pacman.conf /etc/
echo "pacman configuration file copied"
sleep 2

# files in /home/kadar (bashrc, bash_aliases, bashrc)
cp /home/kadar/dotfiles/home/.bash_aliases /home/kadar/
cp /home/kadar/dotfiles/home/.bashrc /home/kadar/
cp /home/kadar/dotfiles/home/.Xresources /home/kadar/
cp /home/kadar/dotfiles/home/.gitconfig /home/kadar/
source ~/.bashrc
echo "Files in home directory copied!"
sleep 2

# pictures for wallpaper
cp -r /home/kadar/dotfiles/Pictures/ /home/kadar/
echo "Pictures/Wallpapers copied!"
sleep 2

# files in /boot
#cp /home/kadar/dotfiles/rEFInd/boot/intel-ucode.img /boot
#cp /home/kadar/dotfiles/rEFInd/boot/refind_linux.conf /boot
#echo "/boot files copied!"
#sleep 2

# files for rEFInd
#cp /home/kadar/dotfiles/rEFInd/efi/refind.conf /efi/EFI/refind/
#echo "rEFInd files copied!"
#sleep 2

# bash powerline
cp /home/kadar/dotfiles/scripts/bash-powerline/.bash-powerline.sh /home/kadar
echo -e '\nsource /home/kadar/.bash_powerline.sh'
echo "bash powerline files copied!"
sleep 2
