#! /bin/bash
# Purpose of this script is to automate installing software necessary for the base system functionality

# Switch users and install some software as non-root
su kadar
cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
exit

echo "Installing base software (audio, bluetooth, others)"
echo " "
sleep 1
pacman -Sy --noconfirm lxdm xorg-xinit mesa xterm xorg-twm xorg-apps xorg-xclock i3-wm i3status i3lock dmenu perl-anyevent-i3 perl-json-xs synaptics net-tools light pulseaudio pavucontrol pulseaudio-alsa alsa-utils openssh vi ttf-font-awesome ttf-dejavu dialog wpa_supplicant feh wget firefox imagemagick rofi scrot iwd bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme iwd zsh grml-zsh-config

# Enable LXDM
systemctl enable lxdm

# Exit chroot
exit
