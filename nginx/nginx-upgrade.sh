#!/usr/bin/env bash
#########################################
#Function:    Edit the location for your nginx binary
#Usage:       bash nginx-upgrade.sh upgrade
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

NGINX_BIN_LOCATION=/usr/sbin/nginx

case $1 in
upgrade)
	$NGINX_BIN_LOCATION -t && kill -USR2 `cat /run/nginx.pid` && echo "SIGUSR2 has been send to the nginx.pid"
	sleep 1
	test -f /run/nginx.pid.oldbin && kill -QUIT `cat /run/nginx.pid.oldbin` && echo "SIGQUIT has been send to the nginx.pid.oldbin"
	;;
*)
	echo "Usage: ./nginx-upgrade.sh upgrade"
	exit 1
esac
