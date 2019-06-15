# Tested 6/21/2016.  Didn't work

import subprocess

def do_things():
    subprocess.call("xinput list", shell=True)
    subprocess.call(["xinput disable", "num"], shell=True)
usb_buffer = subprocess.check_output('xinput', shell=True)
#for str('ID 046d:c52b') in usb_buffer:
for str('ID 06CB:2934') in usb_buffer:
    for id('id=') in usb_buffer:
        num = id 
        do_things()
