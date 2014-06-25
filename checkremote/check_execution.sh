#!/usr/bin/env bash
#########################################
#Function:    To check the url execution time
#Usage:       bash check_execution.sh your_url [-I]
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

START_TIME=$(date +%s)
URL=$1
HEADER=$2
warning=10
critical=20

usage(){
	echo "Usage:"
	echo "./check_execution.sh your_url [-I]"
	echo ""
	echo "Example:" 
	echo "./check_execution.sh https://www.jiasir.org"
	echo "./check_execution.sh https://www.jiasir.org -I"
	echo ""
	echo ""
}

no_header_http(){
	curl $URL
	END_TIME=$(date +%s)
	EXECUTION_TIME=$((END_TIME - START_TIME))
	echo "The Execution Time is: $EXECUTION_TIME s | Execution=$EXECUTION_TIME;$warning;$critical;0;0"
}

no_header_https(){
	curl -k $URL
	END_TIME=$(date +%s)
	EXECUTION_TIME=$((END_TIME - START_TIME))
	echo "The Execution Time is: $EXECUTION_TIME s | Execution=$EXECUTION_TIME;$warning;$critical;0;0"
}

header_http(){
	curl -I $URL
	END_TIME=$(date +%s)
	EXECUTION_TIME=$((END_TIME - START_TIME))
	echo "The Execution Time is: $EXECUTION_TIME s | Execution=$EXECUTION_TIME;$warning;$critical;0;0"
}

header_https(){
	curl -Ik $URL
	END_TIME=$(date +%s)
	EXECUTION_TIME=$((END_TIME - START_TIME))
	echo "The Execution Time is: $EXECUTION_TIME s | Execution=$EXECUTION_TIME;$warning;$critical;0;0"
}

if [[ $URL == "--help" || $URL == "-h" || $URL == "" || $# > "2" ]]; then
	usage
elif [[ `echo "$URL" | grep -E '^http://'` && $HEADER != "header" ]]; then	
	no_header_http
elif [[ `echo "$URL" | grep -E '^https://'` && $HEADER != "header" ]]; then
	no_header_https
elif [[ `echo "$URL" | grep -E '^http://'` && $HEADER == "header" ]]; then
	header_http
elif [[ `echo "$URL" | grep -E '^https://'` && $HEADER == "header" ]]; then
	header_https
else
	echo 'You must begin at "http://" or "https://"'
	echo ""
	usage
fi



