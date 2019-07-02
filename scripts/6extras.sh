#! /bin/bash
# Purpose of this script is to automate installing extra software that isn't
# necessary for the base system functionality
# This script should be executed after the system has been installed and has internet connectivity
# To-do: get a package list once I have everything perfect and just import that into pacman instead
echo "Installing software extras"
echo " "
sleep 3
pacman -Sy --noconfirm git bash-completion powertop htop tlp nmon unzip compton ranger thunar atom tilda hexchat plank conky arc-gtk-theme
sleep 3
