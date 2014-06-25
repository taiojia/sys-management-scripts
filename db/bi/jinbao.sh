SendFile=`ls /home/bi/|grep .txt`
Date=`date +%Y%m%d`
Date1=`date|awk '{print $4}'|sed s/:/_/g`
Bakdir=/work247/bierror/$Date/$Date1
for i in $SendFile
do
mail -s BIError  duzhenhua@shangpin.com,liutao@shangpin.com,tangzhongyi@shangpin.com </home/bi/$i
done

for i in $SendFile
do
if [ -d $Bakdir ];then
mv   /home/bi/$i $Bakdir
else
mkdir -p $Bakdir
mv /home/bi/$i $Bakdir
fi
done