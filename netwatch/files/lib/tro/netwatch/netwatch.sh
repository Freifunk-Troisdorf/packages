if ping -c 1 -w 5 8.8.8.8 > '/dev/null' 2>&1
		then exit
    elif ping -c 1 -w 5 10.188.0.241 > '/dev/null' 2>&1
        then exit
    elif ping6 -c 1 -w 5 2001:4860:4860::8888 > '/dev/null' 2>&1
    	then exit
    elif ping6 -c 1 -w 5 fda0:747e:ab29:7405::101 > '/dev/null' 2>&1
    	then exit
        else reboot        
fi
