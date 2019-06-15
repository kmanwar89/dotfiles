#! /bin/bash

# Copy udev rules
sudo rm /etc/udev/rules.d/99-low-battery-action.rules
sudo rm /etc/udev/rules.d/98-aclidswitch.rules && sleep 1 && echo "Udev rules removed..."

# Copy binary
sudo rm /usr/local/bin/aclidswitch && sleep 1 && echo "Binary removed..."

# Copy config file
sudo rm /etc/default/aclidswitch && sleep 1 && echo "Config file removed..."

sleep 1

echo "Uninstall complete!"
