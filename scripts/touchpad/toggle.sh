# This script toggles the touchpad and sends an on-screen notification and icon.
# Intended for use with the i3 window manager.  Can be adapted for others.

# Tested 6/21/2016.  Having trouble with the notifications, but the script itself works as designed.
# Need to add notification for this to work perfectly.

# Get current touchpad status
pointer_status=$(synclient -l | grep TouchpadOff)
 
if [ -z `echo $pointer_status | grep -o 1` ]; then
        # disable touchpad via Synclient, doesn't disable physical buttons
	synclient TouchpadOff=1 

	# disable physical buttons with xinput
	xinput disable "Synaptics s3203_ver5"

	# send a notification along with a picture for a duration of 1 second (1000 ms) (picture can be customized)
	#notify-send "Touchpad" "Touchpad Disabled"# -i /path/to/disabled.jpg -t 1000

else
	# enable touchpad via Synclient        
	synclient TouchpadOff=0

	# enable physical buttons with xinput
	xinput enable "Synaptics s3203_ver5"

	#notify-send "Touchpad" "Touchpad Enabled" # -i /path/to/enabled.jpg -t 1000
		
	# Enable syndaemon to ignore touch 1 second after ending typing, running as a daemon.
	syndaemon -i 1 -d

	# Natural scrolling
#	synclient HorizScrollDelta=-30
#	synclient VertScrollDelta=-30
fi
