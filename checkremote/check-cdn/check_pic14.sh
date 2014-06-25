#!/usr/bin/env bash
#########################################
#Function:    check CDN status
#Usage:       bash your_script_name.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

date=`date`
domain="pic14.shangpin.com"
tempfile=ip-$domain.tmp
ip=$(/usr/local/nagios/libexec/check_dns -H $domain | awk '{print $9}'| awk -F \| '{print $1}')
[ -f $tempfile ] || touch $tempfile
old_ip=$(cat $tempfile)
if [ -z $old_ip ];then
    echo $ip >$tempfile
    exit 1
else
    if [ $ip != $old_ip ];then
        echo $ip >$tempfile
        echo -ne "We have detected a new CDN IP appears:\n$domain\n$ip\n$date" | mail -s "New CDN IP" jiashuang@shangpin.com,yangcheng@shangpin.com
    fi
fi                        
exit 0
