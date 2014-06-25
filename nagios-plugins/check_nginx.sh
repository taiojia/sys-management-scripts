#!/bin/sh
KPD=`ps aux | grep nginx | grep -v grep | wc -l`
if [ $KPD = 0 ]
then
echo "Critical - ginx process count is $KPD | count=$KPD;0;0;0;0"
exit 2
fi
echo "OK - nginx process count is $KPD | count=$KPD;0;0;0;0"
exit 0