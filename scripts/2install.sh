#! /bin/bash
# Purpose of this script is to automate the remaining ArchLinux install commands prior to chrooting into the installed environment
timedatectl set-ntp true
pacman -Sy --noconfirm reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
sleep 5
# Installation of base system
pacstrap /mnt base base-devel
sleep 2
echo "Generating fstab..."
sleep 1
genfstab -U /mnt >> /mnt/etc/fstab
sleep 3
echo "Install complete. Run '3config.sh' once chrooted into the install environment"
