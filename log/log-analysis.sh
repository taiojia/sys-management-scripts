#!/usr/bin/env bash
#########################################
#Function:    Analysis of web log
#Usage:       bash log-analysis.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

LOG_LOCATION='./www_access.log'
URI="/favicon.ico"

log_format(){
	echo "We ues the following varible:"
	echo "\$http_x_forwarded_for"
	echo "\$remote_user"
	echo "\$time_local"
	echo "\$request"
    echo "\$status $body_bytes_sent"
    echo "\$http_referer"
    echo "\$http_user_agent"
	echo ""
	echo "123.125.71.118" - - [22/Apr/2014:04:39:19 +0800] "GET /brand/brandconcerncontent/?brandNo=B0007&url=http%3A%2F%2Fwww.shangpin.com%2Fwomen%2Fbrand%2Fmiumiu&ran=0.1382376723922789 HTTP/1.1" 200 145 "http://www.shangpin.com/women/brand/miumiu" "Mozilla/5.0 (iphone; U; CPU iPhone OS 4_3_5 like Mac OS X; zh-cn) AppleWebKi"
}
sort_http_code(){
	echo "counts | code"
	awk '{print $9}' $LOG_LOCATION | sort -n | uniq -c | sort -nr
}

200_detail(){
	echo "200 Counts | uri"
	awk '($9 ~ /200/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr && echo remote ip is: && awk '($9 ~ /200/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr | awk '{print $2}' | xargs -i## awk -F'"' '($3 ~ "##"){print $1}' $LOG_LOCATION | grep -v - | sort | uniq -c | sort -nr
}

404_detail(){
	echo "404 Counts | uri"
	awk '($9 ~ /404/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

500_detail(){
	echo "500 Counts | uri"
	awk '($9 ~ /500/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

400_detail(){
	echo "400 Counts | uri"
	awk '($9 ~ /400/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

304_detail(){
	echo "304 Counts | uri"
	awk '($9 ~ /304/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

499_detail(){
	echo "499 Counts | uri"
	awk '($9 ~ /499/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

301_detail(){
	echo "301 Counts | uri"
	awk '($9 ~ /301/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

302_detail(){
	echo "302 Counts | uri"
	awk '($9 ~ /302/)' $LOG_LOCATION | awk '{print $7}' | sort | uniq -c | sort -nr
}

uri_from_ip(){
	awk -F '"' '($3 ~ "$URI") {print $1}' $LOG_LOCATION | grep -v - | sort -n | uniq -c | sort -nr
}

200_detail