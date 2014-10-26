#!/bin/bash

VIP=$2

case "$1" in
start)
echo "Setting VIP......"

ifconfig lo:0 $VIP broadcast $VIP netmask 255.255.255.255 up

route add -host $VIP dev lo:0

echo "1" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "1" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/all/arp_announce
sysctl -p
;;
stop)
echo "Clean the VIP......"

ifconfig lo:0 $VIP broadcast $VIP netmask 255.255.255.255 down

route del -host $VIP dev lo:0

echo "0" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "0" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "0" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "0" > /proc/sys/net/ipv4/conf/all/arp_announce
sysctl -p
;;
*)
echo "Usage: $0 {start|stop} {VIP}"
exit 1
esac
