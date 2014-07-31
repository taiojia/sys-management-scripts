#!/usr/bin/env
#Disable touchpad while typing
#Author: jiasir (Taio Jia) <jiasir@icloud.com>

echo "syndaemon -i 1 -K -d" | sudo tee -a /etc/rc.local
