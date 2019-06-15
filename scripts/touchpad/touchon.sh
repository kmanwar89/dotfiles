#! /bin/sh

# Turn on cursor
synclient TouchpadOff=0

# Turn on buttons
#xinput enable "DLL063E:00 06CB:2934" # old designator for touchpad. New one with Synaptics below:
xinput disable "Synaptics s3203_ver5"

# Show a notification
# Doesn't currently work 6/21/2016
#notify-send "Touchpad" "Touchpad Enabled" -i /path/to/enabled.jpg -t 1000

# Keyboard delay of 1 second after finish typing
syndaemon -i 1 -d

# Natural Scrolling
synclient VertScrollDelta=-30
synclient HorizScrollDelta=-30
