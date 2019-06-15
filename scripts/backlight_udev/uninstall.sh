#! /bin/bash

# Script to remove power-backlight files

sudo rm /etc/udev/rules.d/powersave.rules
sudo rm ~/dotfiles/AC.sh && sleep 2 && echo "AC.sh removed..."
sudo rm ~/dotfiles/battery.sh && sleep 1 && echo "Battery.sh removed..."
sleep 1 && echo "Uninstall complete!"
