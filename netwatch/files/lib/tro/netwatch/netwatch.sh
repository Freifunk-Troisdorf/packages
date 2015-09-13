if ping6 -c 1 -w 5 fda0:747e:ab29:7405::100 > '/dev/null' 2>&1
	then exit 0
    elif ping6 -c 1 -w 5 fda0:747e:ab29:7405::1 > '/dev/null' 2>&1
    	then exit 0
    elif ping6 -c 1 -w 5 fda0:747e:ab29:7405::2 > '/dev/null' 2>&1
    	then exit 0
    elif ping6 -c 1 -w 5 fda0:747e:ab29:7405::3 > '/dev/null' 2>&1
    	then exit 0
    elif ping6 -c 1 -w 5 fda0:747e:ab29:7405::4 > '/dev/null' 2>&1
    	then exit 0
    elif ping6 -c 1 -w 5 fda0:747e:ab29:7405::23 > '/dev/null' 2>&1
    	then exit 0
        else reboot        
fi
