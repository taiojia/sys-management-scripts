#!/usr/bin/env bash
#########################################
#Function:    A simple sed command
#Usage:       bash sed.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

sed -i "s/sa-email,/bcak.com.cn/g" `grep -rl sa-email .`