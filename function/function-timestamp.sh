#!/usr/bin/env bash
#########################################
#Function:    Shell Script function
#Usage:       
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

usage() {
	# Define usage
	echo "Usage: 2014/3/19"
}

# define start time
echo -n "Input start time: "
read start

#define end time
echo -n "Iput end time: "
read end
echo ""

# convert start time and end time to timestamp
if [[ $start != "" && $end != "" ]]; then
	echo "The start timestamp is: " $(date -d "$start 12:00:00" +%s)
	echo "The end timestamp is: " $(date -d "$end 12:00:00" +%s)
else
	usage
fi

