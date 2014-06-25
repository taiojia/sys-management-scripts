#!/bin/sh
#if [ $#-ne 2 ]
#then
# echo "usage:$0 -w num1 -c num2"
#exit 3
#fi
ip_conns=`netstat -tunpe | wc -l`
if [ $ip_conns -lt $1 ]
then
echo "ok -connectcounts is $ip_conns | connection=$ip_conns;$1;$2;0;0"
exit 0
fi

if [ $ip_conns -gt $1 -a $ip_conns -lt $2 ]
then
echo "warning -connectcounts is $ip_conns | connection=$ip_conns;$1;$2;0;0"
exit 1
fi

if [ $ip_conns -gt $2 ]
then
echo "critical -connectcounts is $ip_conns | connection=$ip_conns;$1;$2;0;0"
exit 2
fi
