#! /bin/bash

# Purpose of this script is to automate the remaining ArchLinux install commands prior to chrooting into the installed environment
timedatectl set-ntp true
pacman -Sy --noconfirm reflector
reflector --country US --country Canada --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sleep 5

# Installation of base system
pacstrap /mnt base base-devel linux linux-firmware
sleep 2
echo "Generating fstab..."
sleep 1
genfstab -U /mnt >> /mnt/etc/fstab
sleep 3
echo "Copy over dotfiles into the install environment's home directory to allow scripts to move forward"
sleep 3
cd /mnt/home/ && git clone https://github.com/kmanwar89/dotfiles.git
sleep 3
echo "Chrooting into install environment. Run '3config.sh'"
arch-chroot /mnt/home
