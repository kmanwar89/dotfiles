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
mkswap /dev/sda2 && swapon /dev/sda2
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
arch-chroot /mnt

















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



# Purpose of this script is to automate installing software necessary for the base system functionality

# Switch users and install some software as non-root
su kadar
cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
exit

echo "Installing base software (audio, bluetooth, others)"
echo " "
sleep 1
pacman -Sy --noconfirm lxdm xorg-xinit mesa xterm xorg-twm xorg-apps xorg-xclock i3-wm i3status i3lock dmenu perl-anyevent-i3 perl-json-xs synaptics net-tools light pulseaudio pavucontrol pulseaudio-alsa alsa-utils openssh vi ttf-font-awesome ttf-dejavu dialog wpa_supplicant feh wget firefox imagemagick rofi scrot iwd bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme iwd arch-install-scripts b43-fwcutter base bind-tools broadcom-wl btrfs-progs clonezilla crda darkhttpd ddrescue dhclient dhcpcd diffutils dmraid dnsmasq dosfstools edk2-shell efibootmgr ethtool exfatprogs f2fs-tools fsarchiver gnu-netcat gpm gptfdisk grml-zsh-config haveged hdparm intel-ucode ipw2100-fw ipw2200-fw irssi iwd jfsutils kitty-terminfo lftp linux linux-atm linux-firmware lsscsi lvm2 lynx man-db man-pages mc mdadm memtest86+ mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils mtools nano nbd ndisc6 nfs-utils nilfs-utils nmap ntfs-3g nvme-cli openconnect openssh openvpn partclone parted partimage ppp pptpclient reflector reiserfsprogs rp-pppoe rsync rxvt-unicode-terminfo sdparm sg3_utils smartmontools sudo syslinux systemd-resolvconf tcpdump terminus-font termite-terminfo testdisk usb_modeswitch usbutils vim vpnc wireless-regdb wireless_tools wpa_supplicant wvdial xfsprogs xl2tpd zsh

# Enable LXDM
systemctl enable lxdm

# Exit chroot
exit




# Switch to non-root user for yay commands
su kadar
cd ~
yay -Sy --noconfirm lxdm-themes
exit

# Install & configure LXDM themes
sed -i 's/theme=Industrial/theme=Arch-Dark/g' /etc/lxdm/lxdm.conf
sed -i 's/# bg=\/usr\/share\/backgrounds\/default.png/bg=\/usr\/share\/lxdm\/themes\/Arch-Dark\/archdark.jpg/g' /etc/lxdm/lxdm.conf

# Install & configure rEFInd themes
mkdir /efi/EFI/refind/themes
git clone https://github.com/mireq/rEFInd-Catalina.git && cd rEFInd-Catalina/refind/ && sudo cp -r Catalina /efi/EFI/refind/themes/
echo $'\n\n'# rEFInd Catalina Theme$'\n'#Source: https://github.com/mireq/rEFInd-Catalina$'\n'include themes/Catalina/theme.conf >> /efi/EFI/refind/refind.conf
sed -i 's/#resolution 3/resolution 1920 1080/g' /efi/EFI/refind/refind.conf

# Install audio
pacman -Sy --noconfirm pulseaudio pavucontrol pulseaudio-alsa alsa-utils
# gnome-alsamixer gives an error, probably because I'm not using GNOME as my WDM or DE






# Purpose of this script is to automate installing extra software that isn't
# necessary for the base system functionality
# This script should be executed after the system has been installed and has internet connectivity
# To-do: get a package list once I have everything perfect and just import that into pacman instead
echo "Installing software extras"
echo " "
sleep 3
pacman -Sy --noconfirm git bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme
sleep 3
#option #1
yay teamviewer 




# Purpose of this script is to perform some configurations immediately after booting into a fresh install

# Adding requisite file for DHCP via iwd
# Source: https://insanity.industries/post/simple-networking/ dated MAR 2020
sudo su
touch /etc/iwd/main.conf
echo -e '[General]'
echo -e \# enable builtin DHCP-client within iwd for wifi'
echo -e 'EnableNetworkConfiguration=true'
echo -e '\n'
echo -e '# randomizes mac-address every time iwd starts or the hardware is initially detected'
echo -e 'AddressRandomization=once'
echo -e '\n'
echo -e '[Network]'
echo -e 'NameResolvingService=systemd'

# Enable/Start iwd service to connect to wireless
#sudo systemctl enable --now iwd.service
#sudo systemctl start iwd.service
sudo systemctl enable --now iwd
sudo systemctl enable --now systemd-resolved
exit
