#!/bin/bash

# This script forces a reboot if ping to Google DNS Servers and a supernode fails

# ping google
internet = $(ping -c 1 8.8.8.8)

# if ping fails
if [ $internet -ne "0" ]; then
        # ping supernode to be sure, that it's only the internet connection
        $supernode = $(ping -c 1 10.188.0.241)
        # if ping to supernode fails
        if [ $supernode -ne "0" ]; then
                reboot
        fi
fi
