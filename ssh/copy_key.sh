#!/usr/bin/env bash

server_list=`cat server_list`

for ip in $server_list;
do
ssh-copy-id ops@$ip
done