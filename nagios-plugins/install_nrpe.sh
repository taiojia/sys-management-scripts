#!/bin/sh
yum -y install gcc make openssl openssl-devel
useradd -s /sbin/nologin nagios
cd /root/nagios-client
tar -zxvf nagios-plugins-1.4.16.tar.gz
cd nagios-plugins-1.4.16
./configure --enable-redhat-pthread-workaround
make
make install
cp /root/nagios-client/check_mem /usr/local/nagios/libexec
cp /root/nagios-client/ip_conn.sh /usr/local/nagios/libexec
chmod +x /usr/local/nagios/libexec/check_mem
chmod +x /usr/local/nagios/libexec/ip_conn.sh
cd /root/nagios-client
tar -zxvf nrpe-2.13.tar.gz
cd nrpe-2.13
./configure
make all
make install
mkdir /usr/local/nagios/etc/
cp /root/nagios-client/nrpe.cfg /usr/local/nagios/etc/nrpe.cfg
chown -R nagios:nagios /usr/local/nagios
/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d
echo "/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d" >> /etc/rc.d/rc.local
passwd nagios
