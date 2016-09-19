
#!/bin/sh
/usr/sbin/ntpd -dn -q -p 2.openwrt.pool.ntp.org		Check Time before Run

ROLE=`uci get gluon-node-info.@system[0].role`

OFF_HOUR="22"
ON_HOUR="6"

WIFI24_STATUS=`uci get wireless.client_radio0.disabled`

HOUR=`date +"%H"`

if [ $ROLE == nightshift ]; then

	if [ $HOUR -gt $OFF_HOUR ] || [ $HOUR -lt $ON_HOUR ]; then
		WIFI_OFF=1
	else
		WIFI_OFF=0
	fi

	if [ $WIFI_OFF -eq 0 ]; then									# Wifi Sould be on 	
		ip addr list client0 > /dev/null 2>&1						
		if [ $? -eq 0 ]; then 										# Client network is on
			/sbin/wifi
		else
			uci set wireless.client_radio0.disabled=0				# Turn Wifi On
			uci set wireless.client_radio1.disabled=0				# Also 5Ghz
			/sbin/wifi 												
		fi
	else															# Wifi should be off
		ip addr list client0 > /dev/null 2>&1						# Client network Check
		if [ $? -eq 0 ]; then 										# Client network is on
			uci set wireless.client_radio0.disabled=1				# Shutdown Client Wifi
			uci set wireless.client_radio1.disabled=1				# also 5Ghz
			/sbin/wifi
		fi
	fi
else
	exit 0
fi
