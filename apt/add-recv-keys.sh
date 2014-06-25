#!/usr/bin/env bash
#########################################
#Function:    Add recive key for apt
#Usage:       bash add-recv-keys.sh <your_key>
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $1
