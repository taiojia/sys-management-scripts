#!/usr/bin/env bash
#########################################
#Function:    Shell Script function
#Usage:       
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

enable_forward() {
	# enable forward and defrag
	echo 1 > /proc/sys/net/ipv4/ip_forward
	echo 1 > /proc/sys/net/ipv4/ip_always_defrag
}

enable_defrag() {
	# enable forward and defrag
	echo 1 > /proc/sys/net/ipv4/ip_forward
	echo 1 > /proc/sys/net/ipv4/ip_always_defrag
}

if [[ $# = "1" ]]; then
	case $1 in
		forward )
			enable_forward
			;;
		defrag )
			enable_defrag
			;;
		* )
			echo "Usage: $0 [forward | defrag]" 1>&2
			exit 1
	esac
else
	echo "Usage: $0 [forward | defrag]" 1>&2
	exit 1
fi
