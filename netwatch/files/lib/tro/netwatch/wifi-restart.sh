#!/bin/ash
# Run this script every 5 Minutes
WIFIFAIL=/var/run/wifi_fail
ROLE=mesh
neighbours=`/usr/sbin/batctl o | /bin/grep mesh0 | /usr/bin/wc -l`
getrole=`/sbin/uci get gluon-node-info.@system[0].role`

if [ $getrole = $ROLE ]; then
	if [ $neighbours -lt 1 ];
		/bin/sleep 120
		/sbin/wifi
	else
		exit 0
	fi
else
	exit 0
fi
