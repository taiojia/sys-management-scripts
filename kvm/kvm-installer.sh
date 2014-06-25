#!/usr/bin/env bash
#########################################
#Function:    Install the kvm on Ubuntu 12.04 and above
#Usage:       bash kvm-installer.sh [--enable-virt-manager]
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

sudo apt-get update && sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils 

if [[ $1 == "--enable-virt-manager" ]]; then
	sudo apt-get install virt-manager
fi
