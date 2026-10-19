#!/bin/bash 

threshold=70
usage=$(df | grep '/$' | awk '{print $5}' | tr -d '%')

if [ $usage -gt $threshold ]; then
   echo "WARNING!! Disk usage is at a high level of ${usage}%" >> /var/log/disk_monitor.log
fi
