#! /bin/bash

# Script to automatically setup and install certain aspects of ArchLinux install
# Date: 13 JUNE 2019
# Author: Kadar M. Anwar

ip link set wlp2s0 down

timedatectl set-ntp true
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2 && swapon /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
mkdir /mnt/efi && mount /dev/sda1 /mnt/efi

pacman -Sy reflector
y
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo Archb0x > /etc/hostname
nano /etc/hosts

# Fix this section
echo "127.0.0.1	Archb0x" > /etc/hostname
echo "::1	Archb0x" > /etc/hostname

useradd -m -g users -s /bin/bash kadar
passwd kadar
kadar
kadar

echo "kadar ALL = (ALL) NOPASSWD:ALL" >> /etc/sudoers

sudo pacman -Sy refind-efi intel-ucode



#(echo n; echo p; echo 1; echo 1; echo 200; echo w) | fdisk /dev/sdc

#(echo d; echo 1; echo d; echo 2; echo d) | fdisk /dev/sdc