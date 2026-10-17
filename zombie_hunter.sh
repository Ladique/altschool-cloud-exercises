#!/bin/bash

Log_File="/var/log/zombie_hunter.log"

echo "Zombie search executed on $(date)" >> $Log_File

ps -eo pid,ppid,stat,comm | awk '$3 ~ /Z/ {print "PID: " $1 " | Parent PID: " $2 " | Name: " $4}' >> $Log_File

