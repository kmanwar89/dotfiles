#! /bin/bash
# Purpose of this script is post-installation base configurations, in line with Arch install guide

# While in chroot, need to re-install git, nano & vim
pacman -Sy --noconfirm git nano vim

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
echo "Generating Locale"
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
useradd -m -g users -s /bin/zsh kadar
useradd -m -g users -s /bin/bash thanatos
cat /etc/passwd
sleep 5
echo "Adding user to /etc/sudoers"
echo " "
sudo sh -c "echo \"kadar ALL=(ALL) NOPASSWD:ALL\" " >> /etc/sudoers
sudo sh -c "echo \"thanatos ALL=(ALL) NOPASSWD:ALL\" ">> /etc/sudoers
sleep 3
echo "Validate sudoers has been updated"
sleep 2
echo " "
cat /etc/sudoers | grep kadar
cat /etc/sudoers | grep thanatos

# Installing & Configuring rEFInd bootloader, and adding correct options to /boot/refind_linux.conf
pacman -Sy --noconfirm refind-efi intel-ucode
mkdir /efi && mount /dev/sda1 /efi
refind-install
rm //boot/refind_linux.conf && touch //boot/refind_linux.conf
echo -e " \"Boot using default options\" \t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot using fallback initramfs\" \t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux-fallback.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot to terminal\" \t\t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img systemd.unit=multi-user.target quiet\" " >> /boot/refind_linux.conf
