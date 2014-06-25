#!/usr/bin/env bash
#########################################
#Function:    Init operations for Ubuntu
#Usage:       bash ubuntu-init.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

sudo locale-gen en_US en_US.UTF-8 zh_CN.UTF-8

if [ $? -eq "0" ]; then
	sudo dpkg-reconfigure locales
fi

sudo apt-get update && sudo apt-get -y dist-upgrade

if [ $? -eq "0" ]; then
	sudo reboot
fi