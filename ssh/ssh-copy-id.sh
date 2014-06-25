#!/usr/bin/env bash
#########################################
#Function:    Copy public key to remote server 
#Usage:       bash ssh-copy-id.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

for i in `cat ip.txt`; do
	sudo -u nova -H ssh-copy-id nova@$i < yes
done