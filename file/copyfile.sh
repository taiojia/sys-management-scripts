#!/usr/bin/env bash

server_list=`cat server_list`

for ip in $server_list;
do
/usr/bin/scp get-conns.py ops@$ip:/home/ops
done