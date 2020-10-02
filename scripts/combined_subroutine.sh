#! /bin/bash
# Purpose of this script is to automate the creation, formatting and mounting of partitions during an ArchLinux install following a standard partitioning scheme
# Author: Kadar M Anwar

# stuff here to do outside the chroot: partitioning to genfstab
# Create partitions
echo "Creating partitions..."
sgdisk -p /dev/sda
sgdisk -og /dev/sda
sgdisk -n 1:2048:2097152 -t 1:ef00 /dev/sda
sgdisk -n 2:2099200:35653631 -t 2:8200 /dev/sda
ENDSECTOR=`sgdisk -E $1`
sgdisk -n 3:35653632:$ENDSECTOR -t 3:8300 /dev/sda
sgdisk -c 1:"EFI" -c 2:"Swap" -c 3:"Arch" /dev/sda
sgdisk -p /dev/sda
echo "Partitioning completed!"
sleep 2
# Format partitions
echo "Formatting partitions"
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2 && swapon /dev/sda2
echo y | mkfs.ext4 /dev/sda3
echo "Partition formatting completed!"
sleep 2
# Mount partitions
echo "Mounting partitions to mountpoints"
mount /dev/sda3 /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi
echo "Partitions mounted!"
# Set NTP and update mirrorlist
timedatectl set-ntp true
pacman -Sy --noconfirm reflector
reflector --country US --country Canada --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sleep 3
# Installation of base system
pacstrap /mnt base base-devel linux linux-firmware
echo "Generating fstab..."
genfstab -U /mnt >> /mnt/etc/fstab
echo "Copy over dotfiles into the chroot environment"
cd /mnt/home/ && git clone https://github.com/kmanwar89/dotfiles.git
sleep 2

# # Create a script within the chroot environment, make it executable, then run it below
# touch /mnt/home/dotfiles/part2.sh && chmod +x /mnt/home/dotfiles/part2.sh

# Commands for within the chroot
cat <<EOF > /mnt/home/dotfiles/part2.sh

# Barebone programs needed to move forward
pacman -Sy --noconfirm git nano refind-efi intel-ucode
# Timezone config
echo "Timezone stuff"
sleep 1
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
echo " "
sleep 3
echo "Configuring Locale"
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
locale-gen
echo "Hostname and hosts file setup"
echo Archb0x > /etc/hostname
echo -e "127.0.0.1\tArchb0x\n::1\t\tArchb0x" >> /etc/hosts
# Adding users
useradd -m -g users -s /bin/bash kadar -p kadar
useradd -m -g users -s /bin/bash thanatos -p kadar
sudo sh -c "echo \"kadar ALL=(ALL) NOPASSWD:ALL\" " >> /etc/sudoers
sudo sh -c "echo \"thanatos ALL=(ALL) NOPASSWD:ALL\" ">> /etc/sudoers
echo "Validate sudoers has been updated"
sleep 2
cat /etc/sudoers | grep kadar
cat /etc/sudoers | grep thanatos
# rEFInd installation
mkdir /efi && mount /dev/sda1 /efi
refind-install
rm //boot/refind_linux.conf && touch //boot/refind_linux.conf
echo -e " \"Boot using default options\" \t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot using fallback initramfs\" \t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux-fallback.img quiet\" " >> /boot/refind_linux.conf
echo -e " \"Boot to terminal\" \t\t\t \"root=PARTLABEL=Arch rw add_efi_memmap initrd=/boot/intel-ucode.img initrd=/boot/initramfs-linux.img systemd.unit=multi-user.target quiet\" " >> /boot/refind_linux.conf
pacman -Sy --noconfirm lxdm xorg-xinit mesa xterm xorg-twm xorg-apps xorg-xclock i3-wm i3status i3lock dmenu perl-anyevent-i3 perl-json-xs synaptics net-tools light pulseaudio pavucontrol pulseaudio-alsa alsa-utils openssh vi ttf-font-awesome ttf-dejavu dialog wpa_supplicant feh wget firefox imagemagick rofi scrot iwd bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme iwd arch-install-scripts b43-fwcutter base bind-tools broadcom-wl btrfs-progs clonezilla crda darkhttpd ddrescue dhclient dhcpcd diffutils dmraid dnsmasq dosfstools edk2-shell efibootmgr ethtool exfatprogs f2fs-tools fsarchiver gnu-netcat gpm gptfdisk grml-zsh-config haveged hdparm intel-ucode ipw2100-fw ipw2200-fw irssi iwd jfsutils kitty-terminfo lftp linux linux-atm linux-firmware lsscsi lvm2 lynx man-db man-pages mc mdadm memtest86+ mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils mtools nano nbd ndisc6 nfs-utils nilfs-utils nmap ntfs-3g nvme-cli openconnect openssh openvpn partclone parted partimage ppp pptpclient reflector reiserfsprogs rp-pppoe rsync rxvt-unicode-terminfo sdparm sg3_utils smartmontools sudo syslinux systemd-resolvconf tcpdump terminus-font termite-terminfo testdisk usb_modeswitch usbutils vim vpnc wireless-regdb wireless_tools wpa_supplicant wvdial xfsprogs xl2tpd zsh pulseaudio pavucontrol pulseaudio-alsa alsa-utils git bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme
# Enable LXDM as Login manager
systemctl enable lxdm
# Configure rEFInd theme
mkdir /efi/EFI/refind/themes
git clone https://github.com/mireq/rEFInd-Catalina.git && cd rEFInd-Catalina/refind/ && sudo cp -r Catalina /efi/EFI/refind/themes/
echo $'\n\n'# rEFInd Catalina Theme$'\n'#Source: https://github.com/mireq/rEFInd-Catalina$'\n'include themes/Catalina/theme.conf >> /efi/EFI/refind/refind.conf
sed -i 's/#resolution 3/resolution 1920 1080/g' /efi/EFI/refind/refind.conf

exit # Leave the chroot
EOF

arch-chroot /mnt /home/dotfiles/part2.sh