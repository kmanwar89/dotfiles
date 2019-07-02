#! /bin/bash
# Purpose: Configure system after initial reboot

# Install yay
#git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install & configure LXDM themes
#yay -Sy --noconfirm lxdm-themes
#sed -i 's/theme=Industrial/theme=Arch-Dark/g' /etc/lxdm/lxdm.conf
#sed -i 's/# bg=\/usr\/share\/backgrounds\/default.png/bg=\/usr\/share\/lxdm\/themes\/Arch-Dark\/archdark.jpg/g' /etc/lxdm/lxdm.conf

# Install & configure rEFInd themes
#sudo mkdir /efi/EFI/refind/themes
#git clone https://github.com/mireq/rEFInd-Catalina.git && cd rEFInd-Catalina/refind/ && sudo cp -r Catalina /efi/EFI/refind/themes/
#echo $'\n\n'# rEFInd Catalina Theme$'\n'#Source: https://github.com/mireq/rEFInd-Catalina$'\n'include themes/Catalina/theme.conf >> /efi/EFI/refind/refind.conf

# Install audio
pacman -Sy --noconfirm pulseaudio pavucontrol pulseaudio-alsa alsa-utils
# gnome-alsamixer gives an error, probably because I'm not using GNOME as my WDM or DE
