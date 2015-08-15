#!/bin/sh

# SSID for AP (clients), most cases 'Freifunk'
ffupssid='Freifunk'
# SSID for 'No public internet available'
ffdownssid='Freifunk-Offline'

# two major sites which most likely will not fail at the same time
# and for which a simultaneous outage renders the AP for most end users
# as 'no internet'
pinghost1='fda0:747e:ab29:7405::100'
pingcount1=5 # number of packets which have to fail 100%
delaytime=30 # seconds between attempts
pinghost2='fda0:747e:ab29:7405::53'
pingcount=5

#get current ssid from uci
ssid="$(/sbin/uci get wireless.client_radio0.ssid)"

# it would be nice to have a way to get the real state
# iw dev wlan0-1 info would work, but it is parsing a file
# otherwise we should run a '/sbin/wifi' somwhere to make sure the uci config is active

if ping6 -q -c $pingcount1 $pinghost1 >/dev/null
then
  if [ $ssid != $ffupssid ]
  then
    echo 'AP-SSID change to "'$ffupssid'"'
    /sbin/uci set wireless.client_radio0.ssid=$ffupssid
    /sbin/uci set wireless.client_radio1.ssid=$ffupssid
    /sbin/wifi
  else
   /bin/echo 'AP-SSID is already "'$ffupssid'"'
  fi
else
  # it would be nice to have a way to get the real state
  # iw dev wlan0-1 info would work, but it is parsing a file
  if [ $ssid != $ffdownssid ]
  then
    echo 'ipv6-host "'$pinghost1'" non reachable'
    sleep $delaytime
    if ping6 -q -c $pingcount2 $pinghost2 > /dev/null
    then
      echo '"'$pinghost1'" not reachable, "'$pinghost2'" reachable. doing nothing'
    else
      echo 'AP-SSID changing to "'$ffdownssid'"'
      /sbin/uci set wireless.client_radio0.ssid=$ffdownssid
      /sbin/uci set wireless.client_radio1.ssid=$ffdownssid
      /sbin/wifi
    fi
  else
    /bin/echo 'AP-SSID is already "'$ffdownssid'"'
  fi
fi
