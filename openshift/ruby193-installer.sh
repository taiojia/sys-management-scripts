#!/usr/bin/env bash
#########################################
#Function:    Install ruby193
#Usage:       bash ruby193-installer.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

cat > /etc/yum.repos.d/openshift-origin-deps.repo <<"EOF"
[openshift-origin-deps]
name=OpenShift Origin Dependencies - EL6
baseurl=http://mirror.openshift.com/pub/origin-server/release/3/rhel-6/dependencies/$basearch/
gpgcheck=0
EOF

yum install -y ruby193-ruby
