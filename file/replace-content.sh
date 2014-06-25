#!/usr/bin/env bash
#########################################
#Function:    This script will replace your file content.
#Usage:       bash replace-content.sh <search_name> <replace_name> <location>
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

SEARCH_NAME="$1"
REPLACE_NAME="$2"
LOCATION="$3"

if [[ $1 == "--help" || $1 == "-h" || $# != "3" ]]; then
	echo "Usage: ./replace.sh your_search_name your_replace_name your_location"
else
	sed -i "s/$SEARCH_NAME/$REPLACE_NAME/g" `grep -rl $SEARCH_NAME $LOCATION`
fi
