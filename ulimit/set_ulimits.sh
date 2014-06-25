#!/bin/bash
ulimit -n 655350
cp /etc/security/limits.conf /etc/security/limits.conf-bak
echo "*               soft    nproc              655350" >> /etc/security/limits.conf
echo "*               hard    nproc              655350" >> /etc/security/limits.conf
echo "*               soft    nofile             655350" >> /etc/security/limits.conf
echo "*               hard    nofile             655350" >> /etc/security/limits.conf
