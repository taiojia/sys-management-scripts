#!/usr/bin/env bash
#########################################
#Function:    This script will set system ulimits
#Usage:       bash set-ulimits.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

ulimit -n 655350
cp /etc/security/limits.conf /etc/security/limits.conf-bak
echo "*               soft    nproc              655350" >> /etc/security/limits.conf
echo "*               hard    nproc              655350" >> /etc/security/limits.conf
echo "*               soft    nofile             655350" >> /etc/security/limits.conf
echo "*               hard    nofile             655350" >> /etc/security/limits.conf
