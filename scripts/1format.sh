#! /bin/bash
# Create partitions
sgdisk -p /dev/sda
sgdisk -og /dev/sda
sgdisk -n 1:2048:2097152 -t 1:ef00 /dev/sda
sgdisk -n 2:2099200:35653631 -t 2:8200 /dev/sda
ENDSECTOR=`sgdisk -E $1`
sgdisk -n 3:35653632:$ENDSECTOR -t 3:8300 /dev/sda
sgdisk -c 1:"EFI" -c 2:"Swap" -c 3:"Arch" /dev/sda
sgdisk -p /dev/sda
echo "Partitioning completed!"

# Format partitions
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2 && swapon /dev/sda2
echo y | mkfs.ext4 /dev/sda3
echo "Partition formatting completed!"

# Mount partitions
mount /dev/sda3 /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi
echo "Partitions mounted!"
# Connect to the internet using Wifi-Menu"
