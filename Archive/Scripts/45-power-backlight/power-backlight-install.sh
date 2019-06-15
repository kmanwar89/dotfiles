#! /bin/bash

# This is a script to automatically download and install the power-backlight package from the project's GitHub page and copy the files into the relevant directories, since the AUR link hasn't been updated.

# Clone the git repo
git clone https://github.com/Gen2ly/power-backlight.git && sleep 1 && echo "Repository cloned!"

# Copy the udev rule
sudo cp ./power-backlight/45-power-backlight.rules /etc/udev/rules.d && sleep 1 && echo "Udev rule copied..."

# Copy the binary
sudo cp ./power-backlight/power-backlight /usr/bin && sleep 1 &&  echo "Binary copied..."

# Copy the config file the binary looks for
sudo cp ./power-backlight/power-backlight.conf /etc/default && sleep 1 && echo "Config file copied.  Please edit /etc/default/power-backlight.conf to set values."

# Delete the folder
sudo rm -rf power-backlight/ && sleep 1 && echo "Repository folder deleted"
