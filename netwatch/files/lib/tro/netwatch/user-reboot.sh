#!/bin/sh

/usr/sbin/ntpd -q -p 2.openwrt.pool.ntp.org             #Check Time before Run
# check for connected clients
CLIENTS=`batctl tl |grep W |wc -l`
# if we have clients, no need to restart
if [ $CLIENTS -eq 0 ]; then
  
  reboot

fi