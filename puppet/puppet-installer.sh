#!/usr/bin/env bash
#########################################
#Function:    Install the puppet master or agent on the machine
#Usage:       bash puppet-installer.sh {master | agent}
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

if [[ $1 == 'master' ]]; then
	wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
	sudo dpkg -i puppetlabs-release-precise.deb
	sudo apt-get update
	sudo apt-get -y install puppetmaster-passenger
	sudo apt-get -y install puppetmaster
fi

if [[ $1 == 'agent' ]]; then
	wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
	sudo dpkg -i puppetlabs-release-precise.deb
	sudo apt-get update
	sudo apt-get -y install puppet
fi


