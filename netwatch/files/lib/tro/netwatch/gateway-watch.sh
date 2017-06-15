#!/bin/ash
# Run this script every 5 Minutes
ROLE=uplink
getrole=`/sbin/uci get gluon-node-info.@system[0].role`

if [ $getrole = $ROLE ]; then
	/bin/sleep 120
	if [ `/usr/sbin/batctl gwl | /bin/grep "*" | /usr/bin/wc -l` -lt 1 ]; then
		/sbin/reboot
	else
		exit 0
	fi
fi

ROLE1=meshanduplink

if [ $getrole = $ROLE1 ]; then
	/bin/sleep 120
	if [ `/usr/sbin/batctl o | /bin/grep mesh0 | /usr/bin/wc -l` -lt 1 ]; then
		/sbin/wifi
	elif [ `/usr/sbin/batctl gwl | /bin/grep "*" | /usr/bin/wc -l` -lt 1 ]; then
		/sbin/reboot
	fi
else
	exit 0
fi
