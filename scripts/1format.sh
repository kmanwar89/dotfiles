#! /bin/bash
# Purpose of this script is to automate the creation, formatting and mounting of partitions during an ArchLinux install following a standard partitioning scheme
# Author: Kadar M Anwar
# Create partitions
echo "Creating partitions..."
sleep 2
sgdisk -p /dev/sda
sgdisk -og /dev/sda
sgdisk -n 1:2048:2097152 -t 1:ef00 /dev/sda
sgdisk -n 2:2099200:35653631 -t 2:8200 /dev/sda
ENDSECTOR=`sgdisk -E $1`
sgdisk -n 3:35653632:$ENDSECTOR -t 3:8300 /dev/sda
sgdisk -c 1:"EFI" -c 2:"Swap" -c 3:"Arch" /dev/sda
sgdisk -p /dev/sda
sleep 2
echo "Partitioning completed!"
sleep 3

# Format partitions
echo "Formatting partitions"
sleep 2
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2 && swapon /dev/sda
echo y | mkfs.ext4 /dev/sda3
sleep 2
echo "Partition formatting completed!"
sleep 3


# Mount partitions
echo "Mounting partitions to mountpoints"
sleep 2
mount /dev/sda3 /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi
sleep 2
echo "Partitions mounted!"
sleep 3
echo "Connect to the internet using wifi-menu"
