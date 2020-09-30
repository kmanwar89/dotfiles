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
echo "Chrooting into install environment. Run '3config.sh'"
