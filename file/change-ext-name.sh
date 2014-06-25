#!/usr/bin/env bash
#########################################
#Function:    Batch change files ext name
#Usage:       bash change-ext-name.sh  <old ext name> <new ext name> 
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

for i in `ls *.$1`
do
  mv $i ${i/%$1/$2}
done
