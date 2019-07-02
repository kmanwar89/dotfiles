#! /bin/bash
timedatectl set-ntp true
pacman -Sy --noconfirm reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
sleep 5
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
umount -R /tmp
echo "Run 3config.sh once chrooted into the install environment"
