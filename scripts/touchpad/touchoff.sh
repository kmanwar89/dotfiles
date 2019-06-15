#! /bin/sh

# Turn off cursor
synclient TouchpadOff=1

# Turn off buttons
# 4 JUNE 2019
# xinput disable "DLL063E:00 06CB:2934" #legacy designator for touchpad. Synaptics one below:
xinput disable "Synaptics s3203_ver5"

# Show a notification
# Doesn't currently work 6/21/2016
#notify-send "Touchpad" "Touchpad Disabled" -i /path/to/disabled.jpg -t 1000
