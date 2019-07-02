#! /bin/bash
# Purpose of this script is post-installation base configurations, in line with Arch install guide

# Timezone config
echo "Timezone stuff"
sleep 1
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo " "
sleep 3

# Locale config
echo "Configuring Locale"
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
locale-gen
echo "Validating locale..."
sleep 1
echo "Locale.gen"
cat /etc/locale.gen | grep en_US.UTF-8
sleep 2
echo "Locale.conf"
cat /etc/locale.conf
sleep 2
echo "LANG variable"
echo $LANG
sleep 2
echo " "
sleep 3

# Hostname config
echo "Configuring hostname"
echo Archb0x > /etc/hostname
echo -e "127.0.0.1\tArchb0x\n::1\t\tArchb0x" >> /etc/hosts
sleep 1
echo "Validating hostname"
sleep 1
echo "/etc/hostname"
cat /etc/hostname
sleep 1
echo "/etc/hosts"
cat /etc/hosts
echo " "
sleep 3

# Adding users
useradd -m -g users -s /bin/bash kadar
useradd -m -g users -s /bin/bash thanatos
cat /etc/passwd
echo "Be sure to create passwords for the users once the script completes, and add them to /etc/sudoers!"
echo " "
sleep 3

# Installing & Configuring rEFInd bootloader, and adding correct options to /boot/refind_linux.conf
pacman -Sy --noconfirm refind-efi intel-ucode
refind-install
echo -e " \"Boot using default options\" \t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img uiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot using fallback initramfs\" \t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux-fallback.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot to terminal\" \t\t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img systemd.unit=multi-user.target quiet\" " >> /boot/refind_linux.conf

# Setting WiFi regulatory domain for US
echo "Setting US WiFi regulatory domain"
iw reg set US
