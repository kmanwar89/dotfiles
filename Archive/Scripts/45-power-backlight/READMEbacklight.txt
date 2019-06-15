6/17/2016

This script is for automatic backlight dim/increase on battery/AC power source.

Also includes a script I wrote to automatically install the files in the proper location.

----------------------------------------------------------------------------------------------

steps to manually get power-backlight working (automate with a script)

●	in any directory, git clone https://github.com/Gen2ly/power-backlight.git
●	cd to power-backlight.git
●	cp 45-power-backlight.rules to /etc/udev/rules.d
●	cp power-backlight to /usr/bin
●	cp power-backlight.conf to /etc/default
●	nano power-backlight.conf to set values for AC and Battery brightness
●	manually change brightness with power-backlight -a or -b
●	tested working 12-2-2015 without even a reboot

Two scripts:

Install script will clone repo and copy files to correct location, removing the cloned folder

uninstall script will remove files from each location it was installed to.

thoroughly tested 12-2-2015  


## NOT USING THIS BECAUSE FUNCTIONALITY IS COVERED BY 'light' (https://github.com/haikarainen/light)
	The reason for this is 'light' is what I'm using for keyboard controls, so I may as well use it for controlling screen brightness on A/C/Battery as well.