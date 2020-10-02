# Yay installation
cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && sudo makepkg -si

# Install some stuff using yay
sudo yay -Sy --noconfirm lxdm-themes teamviewer

# Install & configure LXDM themes
sed -i 's/theme=Industrial/theme=Arch-Dark/g' /etc/lxdm/lxdm.conf
sed -i 's/# bg=\/usr\/share\/backgrounds\/default.png/bg=\/usr\/share\/lxdm\/themes\/Arch-Dark\/archdark.jpg/g' /etc/lxdm/lxdm.conf

# Network configurations

# Adding requisite file for DHCP via iwd
# Source: https://insanity.industries/post/simple-networking/ dated MAR 2020
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