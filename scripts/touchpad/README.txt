11 JUNE 2019
------------
Currently using the toggle.sh script with no problem.

8/17/2016

Readme for Touchpad Part 2 Script


off.sh
------
disable touchpad, disable buttons, send a notification (need to get working)

on.sh
-----
enable touchpad, enable buttons, set a typing delay of 1 second, set natural scrolling

toggle.sh
---------
call the above scripts to toggle state



Other implementations below:


# Alternative way of searching for touchpad status?
# if synclient -l | grep "TouchpadOff .*=.*0" ; then

############
# Script 2 #
############
#! /bin/bash
pointer_status=$(synclient -l | grep TouchpadOff)

if [ -z `echo $pointer_status | grep -o 1` ]; then
	sh /home/radak/dotfiles/touchpad/touchon.sh
else
	sh /home/radak/dotfiles/touchpad/touchoff.sh
fi


############
# Script 3 #
############
# Another implementation
#! /bin/sh

# Get an error about 'no protocol specified' and 'Unable to connect to X server' when doing
# this b/c i3 doesn't run an X server in the same way as Mint or Ubuntu --- 6/21/2016

#sleep 1
#TOUCHPAD_NAME='DLL063E:00 06CB:2934'
#DISPLAY=":0.0"
# XAUTHORITY=/var/lib/mdm/:0.Xauth  mdm = Linux Mint
#XAUTHORITY=~/.Xauthority/
#export DISPLAY XAUTHORITY
#tpID=$(xinput list | grep -i $TOUCHPAD_NAME | awk '{ print $6 }' | sed 's/id=//')
#case "$1" in
#   on)
#   /usr/bin/xinput --enable $tpID
#   ;;
#   off)
#   /usr/bin/xinput --disable $tpID
#   ;;
#esac

############
# Script 4 #
############
# Another implementation from the Arch Wiki
#!/bin/bash

# Tested 6/21/2016.  Didn't work

#declare -i ID
#ID=`xinput list | grep -Eio 'DLL\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
#declare -i STATE
#STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
#if [ $STATE -eq 1 ]
#then
#  xinput disable $ID
#  echo "Touchpad disabled."
#  # notify-send 'Touchpad' 'Disabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
#else
#  xinput enable $ID
#  echo "Touchpad enabled."
#  # notify-send 'Touchpad' 'Enabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
#fi


Other random touchpad code:
#bindsym F7 exec synclient TouchpadOff=$(synclient | awk '/TouchpadOff/ {print ($3+1)%2}')  # Source: #https://github.com/ivyl/i3-config/blob/master/config
#bindsym F7 exec --no-startup-id sh ~/scripts/touchpad.sh && exec i3-nagbar -t warning -m 'Touchpad #Toggled'

