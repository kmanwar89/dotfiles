#! /bin/bash
# Purpose of this script is to perform some configurations immediately after booting into a fresh install

# Adding requisite file for DHCP via iwd
# Source: https://insanity.industries/post/simple-networking/ dated MAR 2020
sudo su
touch /etc/iwd/main.conf
echo -e '[General]'
echo -e '\n'
echo -e '# uncomment for setting the wifi interface name yourself'
echo -e '# see https://iwd.wiki.kernel.org/interface_lifecycle'
echo -e '#UseDefaultInterface=true'
echo -e '\n'
echo -e \# enable builtin DHCP-client within iwd for wifi'
echo -e 'EnableNetworkConfiguration=true'
echo -e '\n'
echo -e '# randomizes mac-address every time iwd starts or the hardware is initially detected'
echo -e 'AddressRandomization=once'

# Enable/Start iwd service to connect to wireless
#sudo systemctl enable --now iwd.service
#sudo systemctl start iwd.service
sudo systemctl enable --now iwd

exit
