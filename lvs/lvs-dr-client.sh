#!/usr/bin/env bash
#########################################
#Function:    Set or remove the VIP for LVS dr mode
#Usage:       bash lvs-dr-client.sh {start|stop}
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

# Define VIP
VIP=172.20.10.18

case "$1" in

start)
echo "start LVS of DR"

ifconfig lo:0 $VIP broadcast $VIP netmask 255.255.255.255 up

route add -host $VIP dev lo:0

echo "1" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "1" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/all/arp_announce
sysctl -p
;;
stop)
echo "stop LVS of DR"

ifconfig lo:0 $VIP broadcast $VIP netmask 255.255.255.255 down

route del -host $VIP dev lo:0

echo "0" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "0" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "0" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "0" > /proc/sys/net/ipv4/conf/all/arp_announce
sysctl -p
;;
*)
echo "Usage: $0 {start|stop}"
exit 1
esac

