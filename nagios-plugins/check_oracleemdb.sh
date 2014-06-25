#!/bin/sh
KPD=`ps aux | grep 'oracleemdb' |grep -v grep |wc -l`
if [ $KPD = 0 ]
then
echo "Critical - oracleemdb process count is $KPD | count=$KPD;0;0;0;0"
exit 2
fi
echo "OK - oracleemdb process count is $KPD | count=$KPD;0;0;0;0"
exit 0