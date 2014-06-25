#!/usr/bin/env bash
#########################################
#Function:    Shell Script function
#Usage:       
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

clean_up() {

	# Perform program exit housekeeping
	# Optionally accepts an exit status
	# you can do somthing here
	exit $1
}

trap clean_up SIGHUP SIGINT SIGTERM

# The function usage, invoke clean_up function and set exit status 1
clean_up 1