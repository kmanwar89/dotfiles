#! /bin/bash

# Purpose: To control the backlight brightness on AC/Battery power automatically
# using udev rules and scripts.

# Copy the udev rule
sudo cp ./powersave.rules /etc/udev/rules.d

# Copy the scripts
sudo cp ./AC.sh ~/dotfiles
sudo cp ./battery.sh ~/dotfiles