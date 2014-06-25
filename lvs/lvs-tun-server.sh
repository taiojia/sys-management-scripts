#!/usr/bin/env bash
#########################################
#Function:    Set or remove the VIP for LVS tun mode
#Usage:       bash lvs-tun-server.sh {start|stop}
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

# Define VIP
VIP=192.168.152.250

# Define RIP
RIP1=192.168.152.151
RIP2=192.168.152.152

case "$1" in
start)
echo "start lvs of TUN"
/sbin/ifconfig tunl0 $VIP broadcast $VIP netmask 255.255.255.0 up
/sbin/route add -host $VIP dev tunl0
/sbin/ipvsadm -C
/sbin/ipvsadm -A -t $VIP:80 -s rr
/sbin/ipvsadm -a -t $VIP:80 -r $RIP1:80 -i
/sbin/ipvsadm -a -t $VIP:80 -r $RIP2:80 -i
/sbin/ipvsadm
;;
stop)
echo "stop lvs of TUN"
/sbin/ipvsadm -C
/sbin/ifconfig tunl0 down
;;
*)
echo "Usage: $0 {start|stop}"
exit 1
esac
