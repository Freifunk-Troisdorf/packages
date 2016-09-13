#!/bin/ash
# Run this script every 5 Minutes
ROLE=uplink
gateways=`/usr/sbin/batctl gwl | /bin/grep "=>" | /usr/bin/wc -l`
getrole=`/sbin/uci get gluon-node-info.@system[0].role`

if [ $getrole = $ROLE ]; then
	/bin/sleep 120
	if [ $gateways -lt 1 ]; then
		/sbin/reboot
	else
		exit 0
	fi
fi

ROLE1=meshanduplink
neighbours=`/usr/sbin/batctl o | /bin/grep mesh0 | /usr/bin/wc -l`

if [ $getrole = $ROLE1 ]; then
	/bin/sleep 120
	if [ $neighbours -lt 1 ]; then
		/sbin/wifi
	elif [ $gateways -lt 1 ]; then
		/sbin/reboot
	fi
else
	exit 0
fi
