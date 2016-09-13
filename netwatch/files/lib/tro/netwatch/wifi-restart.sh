#!/bin/ash
# Run this script every 5 Minutes
ROLE=mesh
neighbours=`/usr/sbin/batctl o | /bin/grep mesh0 | /usr/bin/wc -l`
getrole=`/sbin/uci get gluon-node-info.@system[0].role`

if [ $getrole = $ROLE ]; then
		/bin/sleep 60
		if [ $neighbours -lt 1 ]; then
		/sbin/wifi
	fi
else
	exit 0
fi
