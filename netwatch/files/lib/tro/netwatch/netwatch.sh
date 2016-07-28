
#!/bin/sh

# At first some Definitions:
UPPER_LIMIT='25' #Above this limit the node will stay online
LOWER_LIMIT='20' #Below this limit the node will reboot

#Is there an active Gateway?
GATEWAY_TQ=$(batctl gwl | grep "^=>" | awk -F'[()]' '{print $2}'| tr -d " ") #Grep the connection quality of the gateway which is currently used
GATEWAY_TQ="${GATEWAY_TQ-0}" # 0 if empty
if [ "$GATEWAY_TQ" -gt "$UPPER_LIMIT" ]; then
	logger -s -t "gluon-reboot-script" -p 5 "TQ is $GATEWAY_TQ, Node is online" #Write Info to Syslog
fi
if [ "$GATEWAY_TQ" -lt "$LOWER_LIMIT" ]; then
	echo "Gateway TQ is $GATEWAY_TQ node is considered offline"
	logger -s -t "gluon-reboot-script" -p 5 "TQ is $GATEWAY_TQ, Node is offline. Triggering reboot" #Write Info to Syslog
	reboot
fi
if [ "$GATEWAY_TQ" -ge "$LOWER_LIMIT" -a "$GATEWAY_TQ" -le "$UPPER_LIMIT" ];  then # it's just get a clean run if we are in-between the grace periode
	echo "TQ is $GATEWAY_TQ, do nothing"
fi
