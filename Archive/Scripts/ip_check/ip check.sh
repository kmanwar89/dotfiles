#!/bin/bash

publicip=$(dig +short myip.opendns.com @resolver1.opendns.com)

# Checks to see if there is a file which contains my current IP:
if [ ! -e /tmp/currentip ] || [ "$(cat /tmp/currentip)" != "$publicip" ]; then
        # First, write it to /tmp/currentip
        echo $publicip  > /tmp/currentip
        # Email me, to notify me of my new IP so I can use it.
        mutt -s "Your new IP is: " kadaranwar07@gmail.com < /tmp/currentip
fi
