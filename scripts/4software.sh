#! /bin/bash
# Purpose of this script is to automate installing software necessary for the base system functionality

# Switch users and install some software as non-root
su kadar
cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
exit

echo "Installing base software (audio, bluetooth, others)"
echo " "
sleep 1
pacman -Sy --noconfirm lxdm xorg-xinit mesa xterm xorg-twm xorg-apps xorg-xclock i3-wm i3status i3lock dmenu perl-anyevent-i3 perl-json-xs synaptics net-tools light pulseaudio pavucontrol pulseaudio-alsa alsa-utils openssh vi ttf-font-awesome ttf-dejavu dialog wpa_supplicant feh wget firefox imagemagick rofi scrot iwd bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme iwd arch-install-scripts b43-fwcutter base bind-tools broadcom-wl btrfs-progs clonezilla crda darkhttpd ddrescue dhclient dhcpcd diffutils dmraid dnsmasq dosfstools edk2-shell efibootmgr ethtool exfatprogs f2fs-tools fsarchiver gnu-netcat gpm gptfdisk grml-zsh-config haveged hdparm intel-ucode ipw2100-fw ipw2200-fw irssi iwd jfsutils kitty-terminfo lftp linux linux-atm linux-firmware lsscsi lvm2 lynx man-db man-pages mc mdadm memtest86+ mkinitcpio mkinitcpio-archiso mkinitcpio-nfs-utils mtools nano nbd ndisc6 nfs-utils nilfs-utils nmap ntfs-3g nvme-cli openconnect openssh openvpn partclone parted partimage ppp pptpclient reflector reiserfsprogs rp-pppoe rsync rxvt-unicode-terminfo sdparm sg3_utils smartmontools sudo syslinux systemd-resolvconf tcpdump terminus-font termite-terminfo testdisk usb_modeswitch usbutils vim vpnc wireless-regdb wireless_tools wpa_supplicant wvdial xfsprogs xl2tpd zsh pulseaudio pavucontrol pulseaudio-alsa alsa-utils git bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme

# Enable LXDM
systemctl enable lxdm

# Exit chroot
exit
