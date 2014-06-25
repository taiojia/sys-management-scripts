#!/usr/bin/env bash
#########################################
#Function:    Deploy foreman on Ubuntu 12.04
#Usage:       bash foreman-installer.sh
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

echo "deb http://deb.theforeman.org/ precise 1.5" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.5" | sudo tee -a /etc/apt/sources.list.d/foreman.list

if [ $? -eq "0" ]; then
	wget -q http://deb.theforeman.org/foreman.asc -O- | sudo apt-key add -
fi

if [ $? -eq "0" ]; then
	sudo apt-get update && sudo apt-get -y install foreman-installer
fi

# you can modify the flowing parameter if you want.
sudo foreman-installer \
  --enable-foreman-proxy \
  --foreman-proxy-tftp=true \
  --foreman-proxy-tftp-servername=172.20.10.222 \
  --foreman-proxy-dhcp=true \
  --foreman-proxy-dhcp-interface=eth0 \
  --foreman-proxy-dhcp-gateway=172.20.10.1 \
  --foreman-proxy-dhcp-range="172.20.10.116 172.20.10.122" \
  --foreman-proxy-dhcp-nameservers="172.20.10.222,202.106.0.20" \
  --foreman-proxy-dns=true \
  --foreman-proxy-dns-interface=eth0 \
  --foreman-proxy-dns-zone=shangpin.com \
  --foreman-proxy-dns-reverse=10.20.172.in-addr.arpa \
  --foreman-proxy-dns-forwarders=202.106.0.20 \
  --foreman-proxy-dns-forwarders=202.106.196.115 \
  --foreman-proxy-foreman-base-url=https://172-20-10-222.shangpin.com \
  --foreman-proxy-oauth-consumer-key=binNuXFqJTxULv4wBAkjXLJCi5qDBdpD \
  --foreman-proxy-oauth-consumer-secret=KdKpN6sTWRceMuwnUdnA4mUbU4NYTZ3S \
  --enable-foreman-compute-openstack
