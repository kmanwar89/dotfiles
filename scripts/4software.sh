#! /bin/bash
# Purpose of this script is to automate installing software
# To-do: get a package list once I have everything perfect and just import that into pacman instead
echo "Installing software..."
echo " "
sleep 1
pacman -Sy --noconfirm lxdm xorg-xinit mesa xterm xorg-twm xorg-apps xorg-xclock i3-wm i3status i3lock dmenu perl-anyevent-i3 perl-json-xs synaptics net-tools light git bash-completion alsa-utils powertop htop tlp openssh vi ttf-font-awesome nmon unzip compton ranger thunar ttf-dejavu dialog wpa_supplicant atom tilda feh hexchat plank conky arc-gtk-theme wget firefox imagemagick rofi scrot
sleep 3

# Enable LXDM
systemctl enable lxdm

# Exit chroot
exit