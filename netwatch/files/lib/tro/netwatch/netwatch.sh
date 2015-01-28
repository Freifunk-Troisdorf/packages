if ping -c 1 -w 5 8.8.8.8 > '/dev/null' 2>&1
then exit
    elif ping -c 1 -w 10.188.0.241 > '/dev/null' 2>&1
        then exit
        else reboot
        
fi
