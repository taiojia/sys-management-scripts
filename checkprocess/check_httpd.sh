#!/usr/bin/env bash
#########################################
#Function:    To check the httpd process running or stoped
#Usage:       bash check_httpd.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

HTTPPORT=`nmap localhost -p 80 | grep open | wc -l`

if [ $HTTPPORT -eq 1 ]; then
	echo "running"
else
	echo "stoped"
fi
