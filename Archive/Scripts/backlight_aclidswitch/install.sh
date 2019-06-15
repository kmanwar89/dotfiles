#! /bin/bash

# Copy udev rules
sudo cp *.rules /etc/udev/rules.d && sleep 1 && echo "Udev rules copied..."

# Copy binary
sudo cp ./aclidswitch /usr/local/bin/ && sleep 1 && echo "Binary copied..."

# Copy config file
sudo cp ./aclidswitch.conf /etc/default/aclidswitch && sleep 1 && echo "Config file copied..."

sleep 1

echo "Install complete!"
