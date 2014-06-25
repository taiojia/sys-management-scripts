#!/bin/bash
#Author: Jiashuang
ACT_COUNT=0
Inactive_count=0
stat1=`sudo ipvsadm | grep http | grep -E 'Local|Route' |wc -l`
if [ $stat1 -ne 0 ];then
for NUM in `sudo ipvsadm | grep http | grep -E 'Local|Route' | awk '{print $5}'`
do
ACT_COUNT=$(($ACT_COUNT+ $NUM))
done
for NUM in `sudo ipvsadm | grep http | grep -E 'Local|Route' | awk '{print $6}'`
do
Inactive_count=$(($Inactive_count+ $NUM))
done
else
echo "LVS CRITICAL, "LVS is Down""
exit 2
fi
if [ $ACT_COUNT == 0 ];then
echo "LVS ok, "0 active connection""
exit 1
else
echo "LVS OK - LVS is running (conn: $ACT_COUNT active, $Inactive_count inactive)|active=$ACT_COUNT;69999;99999;0; inactive=$Inactive_count;69999;99999;0;"
fi
