#!/bin/bash
echo -e  "####################`date +%F`" >> /mnt/logs/400.txt
echo -e  "####################`date +%F`" >> /mnt/logs/URL.txt
echo -e  "####################`date +%F`" >> /mnt/logs/IP.txt
cat $1 | wc -l >> /mnt/logs/IP.txt   #分析IP
cat  $1  | awk -F'"'  '{print $3}' | awk '{print $1}' | sort | uniq -c| sort -rn >  /mnt/logs/CODE.txt   #分析返回值
cat $1 |  awk   '{print $1}' |  sort | uniq -c| sort -rn | head -n20  >> /mnt/logs/IP.txt 
N=`cat /mnt/logs/CODE.txt | wc -l`
for I in $(seq 1 $N)
do
M=`head -n$I /mnt/logs/CODE.txt | tail -n1 | awk '{print $2}'`
if [ $M -ge 400 ]
then

echo "#####FIND $M###############">>/mnt/logs/400.txt   #分析错误请求
cat $1 | grep "\" $M "  | grep -v ' "-" "-" - ' | sort | awk '{print $1 $2 $3 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15 $16 $17 $18 $19 $20 $21}' | sort | uniq -c  | sort -rn  | head -n5 >> /mnt/logs/400.txt
fi
done
cat  $1 | grep -v ' "-" "-" - ' | awk -F'T' '{print $2}' | awk -F'?' '{print $1}' | sort |awk '{print $1}' | sed  's/\(\/review\/file\/download\/\).*/\1/g'   | sort | uniq -c | sort -rn | head -n20 >> /mnt/logs/URL.txt 