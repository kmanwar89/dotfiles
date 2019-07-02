#! /bin/bash
#ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
#hwclock --systohc

#sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
#cat /etc/locale.gen | grep en_US.UTF-8
#echo " "
#sleep 3

#locale-gen

#echo LANG=en_US.UTF-8 > /etc/locale.conf
#cat /etc/locale.conf
#echo " "
#sleep 3

#export LANG=en_US.UTF-8
#echo $LANG
#echo " "
#sleep 3

#echo Archb0x > /etc/hostname
#cat /etc/hostname
#echo " "
#sleep 3

#echo -e "127.0.0.1\tArchb0x\n::1\t\tArchb0x" >> /etc/hosts
#cat /etc/hosts
#echo " "
#sleep 3

#useradd -m -g users -s /bin/bash kadar
#useradd -m -g users -s /bin/bash thanatos
#cat /etc/passwd
#echo "Be sure to create passwords for the users once the script completes, and add them to /etc/sudoers!"
#echo " "
#sleep 3

pacman -Sy --noconfirm refind-efi intel-ucode
refind-install
echo -e " \"Boot using default options\" \t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot using fallback initramfs\" \t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux-fallback.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot to terminal\" \t\t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img systemd.unit=multi-user.target quiet\" " >> /boot/refind_linux.conf
