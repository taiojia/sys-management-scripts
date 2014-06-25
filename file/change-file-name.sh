#!/usr/bin/env bash
#########################################
#Function:    Batch change files name
#Usage:       bash change-file-name.sh <directory to match the file you want> <old file name> <new file name> 
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

for i in `ls $1`
do
  mv $i ${i/$2/$3}
done
