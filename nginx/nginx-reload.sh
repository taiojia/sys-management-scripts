#!/usr/bin/env bash
#########################################
#Function:    This script is reload both 172.20.10.12 and 172.20.10.70's nginx process.
#Usage:       bash nginx-reload.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

NGINX_PID_12=$(ps aux | grep 'nginx: master process' | grep -v grep | awk '{ print$2 }')
GET_70_PID=$(echo "ps aux | grep 'nginx: master process' | grep -v grep" | ssh root@172.20.10.70 bash)
NGINX_PID_70=$(echo $GET_70_PID | awk '{ print $2 }')
kill -HUP $NGINX_PID_12 && echo "172.20.10.12's Nginx has beed reloaded."
kill -HUP $NGINX_PID_70 && echo "172.20.10.70's nginx has beed reloaded."
