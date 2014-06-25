#!/bin/sh
yum -y install net-snmp
cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf-20130927
cd /root/nagios-client
cp snmpd.conf /etc/snmp/snmpd.conf
service snmpd start
chkconfig snmpd on

