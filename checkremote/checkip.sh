#!/usr/bin/env bash
#########################################
#Function:    Check remote ip status
#Usage:       bash checkip.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

for i in `cat allip`
do
ping=`ping -c 1 $i|grep loss|awk '{print $8}'|awk -F "%" '{print $1}'`
if [ $ping -eq 100  ];then
echo ping $i fail
else
echo ping $i ok
fi
done