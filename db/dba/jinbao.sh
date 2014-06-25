SendFile=`ls /home/dba/|grep .txt`
Date=`date +%Y%m%d`
Date1=`date|awk '{print $4}'|sed s/:/_/g`
Bakdir=/work247/SQLError/$Date/$Date1
for i in $SendFile
do
mail -s SQLError  15810082777@139.com,gaosuzhen@shangpin.com,wangzhuo@shangpin.com,13718178212@139.com,wangxinyu@shangpin.com</home/dba/$i
done

for i in $SendFile
do
if [ -d $Bakdir ];then
mv   /home/dba/$i $Bakdir
else
mkdir -p $Bakdir
mv /home/dba/$i $Bakdir
fi
done