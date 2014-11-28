#!/usr/bin/env python

import os

os.system('sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm')
os.system('sudo yum install puppet-server')
