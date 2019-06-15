#! /bin/bash

# Script to remove power-backlight files

sudo rm /etc/udev/rules.d/45-power-backlight.rules && sleep 1 && echo "Udev rule removed..."
sudo rm /etc/default/power-backlight.conf && sleep 2 && echo "Config file removed..."
sudo rm /usr/bin/power-backlight && sleep 1 && echo "Binary file removed..."
sleep 1 && echo "Uninstall complete!"
