while :
do
num1=`ls /home/dba/|grep .txt|wc -l`
num2=`ls /home/bi/|grep .txt|wc -l`
if [ $num1 -gt 0 ];then
sh /home/dba/jinbao.sh
fi
if [ $num2 -gt 0 ];then
sh /home/bi/jinbao.sh
fi
done