#! /bin/bash
# Purpose of this script is to automate installing software necessary for the base system functionality

echo "Installing base software (audio, bluetooth, others)"
echo " "
sleep 1
pacman -Sy --noconfirm lxdm xorg-xinit mesa xterm xorg-twm xorg-apps xorg-xclock i3-wm i3status i3lock dmenu perl-anyevent-i3 perl-json-xs synaptics net-tools light pulseaudio pavucontrol pulseaudio-alsa alsa-utils openssh vi ttf-font-awesome ttf-dejavu dialog wpa_supplicant feh wget firefox imagemagick rofi scrot

# Enable LXDM
systemctl enable lxdm

# Exit chroot
exit
