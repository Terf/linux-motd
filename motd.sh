#!/bin/bash

uptime=`uptime | cut -f1 -d, | cut -c 14-`
printf "Up for ${uptime}\n"
/etc/update-motd.d/linux-motd/services.sh
/etc/update-motd.d/linux-motd/cpu.sh
/etc/update-motd.d/linux-motd/diskspace.sh

