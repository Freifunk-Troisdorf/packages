if ping -c 1 -w 5 8.8.8.9 > '/dev/null' 2>&1
then echo 'Online'
    elif ping -c 1 -w 5 8.8.8.10 > '/dev/null' 2>&1
        then echo "online 2"
        else echo "reboot"
        
fi
