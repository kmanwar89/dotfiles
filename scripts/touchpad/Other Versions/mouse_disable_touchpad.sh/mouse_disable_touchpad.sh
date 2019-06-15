#!/bin/bash
# mouse_disable_touchpad.sh
# chmod 755 this script (probably) to make it executable
# sanity check that `lsusb | grep 'Unifying Receiver'` does what we want it to
# double check that the gsettings commands are correct by running `gsettings list-recursively | grep touchpad`
# on the command line, and/or test the gsettings commands on the command line, but you don't need to prepend the
# gsettings commands with `exec` outside of the script.
# (the while true loop never ends)
# if gsettings commands don't work to toggle touchpad, another option is synclient commands
 
while true
do
  # pipe output of lsusb, but silence the output by redirecting it to /dev/null
  lsusb | grep 'Unifying Receiver' &>/dev/null
  # assign has_mouse to the return value of last command, (0 is true and 1 is false in the shell)
  has_mouse=$?
  # if statements and bracket tests
  if [ "$has_mouse" -eq 0 ]
  then
    touchpad_is_enabled=$(gsettings get org.gnome.settings-daemon.peripherals.touchpad touchpad-enabled)
    if [ "$touchpad_is_enabled" == true ]
    then # if touchpad is enabled, disable it
      exec gsettings set org.gnome.settings-daemon.peripherals.touchpad touchpad-enabled false
      # command *might* need to be run twice, in which case uncomment next line
      # exec gsettings set org.gnome.settings-daemon.peripherals.touchpad touchpad-enabled false
    fi
  else # else the mouse must not be plugged in, so enable touchpad (if disabled)
    touchpad_is_enabled=$(gsettings get org.gnome.settings-daemon.peripherals.touchpad touchpad-enabled)
    if [ "$touchpad_is_enabled" == false ]
    then
      exec gsettings set org.gnome.settings-daemon.peripherals.touchpad touchpad-enabled true
      # again the command *may* need to be run twice, in which case uncomment next line
      # exec gsettings set org.gnome.settings-daemon.peripherals.touchpad touchpad-enabled true
    fi
  fi
  sleep 30  # adjust number of sleep seconds to taste
done
