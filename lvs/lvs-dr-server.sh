#!/usr/bin/env bash
#########################################
#Function:    Set or remove the VIP for LVS dr mode
#Usage:       bash lvs-dr-server.sh {start|stop}
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

# Define VIP
VIP=192.168.1.118

# Define RIP
RIP1=192.168.1.23
RIP2=192.168.1.19

case "$1" in

start)
echo "start LVS of DR"

ifconfig eth0:0 $VIP broadcast $VIP netmask 255.255.255.255 up

route add -host $VIP dev eth0:0


ipvsadm -C
ipvsadm -Z


ipvsadm -A -t $VIP:80 -s wlc
ipvsadm -a -t $VIP:80 -r $RIP1:80 -g
ipvsadm -a -t $VIP:80 -r $RIP2:80 -g


ipvsadm
;;
stop)
echo "stop LVS of DR"
ifconfig eth0:0 $VIP broadcast $VIP netmask 255.255.255.255 down

route del -host $VIP dev eth0:0
ipvsadm -C
ipvsadm -Z
;;
*)
echo "Usage: $0 {start|stop}"
exit 1
esac

