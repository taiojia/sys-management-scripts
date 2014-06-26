#!/usr/bin/env bash
#########################################
#Function:    An example of setting promiscuous mode on an interface on Ubuntu.
#Usage:       bash enable-promiscuous.sh <interfacename>
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################


echo "auto $1
iface $1 inet manual
    up ifconfig \$IFACE 0.0.0.0 up
    up ifconfig \$IFACE promisc" >> /etc/network/interfaces