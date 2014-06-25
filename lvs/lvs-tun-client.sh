#!/usr/bin/env bash
#########################################
#Function:    Set or remove the VIP for LVS tun mode
#Usage:       bash lvs-tun-client.sh {start|stop}
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

# Define VIP
VIP=192.168.152.250

case "$1" in
start)
echo "Start LVS of TUN"
/sbin/ifconfig tunl0 $VIP broadcast $VIP netmask 255.255.255.255 up
/sbin/route add -host $VIP dev tunl0
echo "1" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "1" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/all/arp_announce
;;
stop)
echo "Stop LVS of TUN"
/sbin/ifconfig tunl0 down
echo "0" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "0" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "0" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "0" > /proc/sys/net/ipv4/conf/all/arp_announce
;;
*)
echo "Usage: $0 {start|stop}"
exit 1
esac
