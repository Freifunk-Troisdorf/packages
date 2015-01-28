#/bin/bash
 
internet = $(ping -c 1 8.8.8.8)
 
if [ $internet -ne "0" ]; then
        $supernode = $(ping -c 1 10.188.0.241)
        if [ $supernode -ne "0" ]; then
                reboot
        fi
fi