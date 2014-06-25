#!/usr/bin/env bash
#########################################
#Function:    Install the ThinkPad E431 Wi-Fi driver
#Usage:       bash e431-wifi-installer.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

sudo apt-get update
sudo apt-get install linux-headers$(uname -r | grep -Po "\-[a-z].*")
sudo apt-get install build-essential dkms
sudo apt-get install dpkg
sudo apt-get install bcmwl-kernel-source
