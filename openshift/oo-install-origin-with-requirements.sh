#!/usr/bin/env bash
#########################################
#Function:    Install openshift orogin and requirements
#Usage:       bash oo-install-origin-with-requirements.sh {target | broker | all-in-one}
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

# install EPEL for CentOS 6
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# add the openshift repo
cat > /etc/yum.repos.d/openshift-origin-deps.repo <<"EOF"
[openshift-origin-deps]
name=OpenShift Origin Dependencies - EL6
baseurl=http://mirror.openshift.com/pub/origin-server/release/3/rhel-6/dependencies/$basearch/
gpgcheck=0
EOF

# install ruby193
yum makecache && yum -y install ruby193-ruby


if [[ $1 == "target" ]]; then
	# install the base installer requirements for target
	yum -y install ruby unzip curl puppet augeas
elif [[ $1 == "broker" ]]; then
	# install the base installer requirements for broker
	yum -y install bind httpd-tools
elif [[ $1 == "all-in-one" ]]; then
	# install the base installer requirements for all in one
	yum -y install ruby unzip curl puppet augeas bind httpd-tools
fi

# install openshift-origin
sh <(curl -s https://install.openshift.com/)





