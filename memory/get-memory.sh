#!/usr/bin/env bash
#########################################
#Function:    List memory of the machine
#Usage:       bash get-memory.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

act_mem=$((`grep MemTotal: /proc/meminfo | sed 's/^MemTotal: *//'|sed 's/ .*//'` / 1024))
echo $act_mem