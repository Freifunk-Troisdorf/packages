#!/bin/ash
# Run this script every 5 Minutes
ROLE=uplink
gateways=`/usr/sbin/batctl gwl | /bin/grep 6b:04 | /usr/bin/wc -l`
getrole=`/sbin/uci get gluon-node-info.@system[0].role`

if [ $getrole = $ROLE ]; then
	/bin/sleep 120
	if [ $gateways -lt 1 ];
		/sbin/reboot
	else
		exit 0
	fi
else
	exit 0
fi
