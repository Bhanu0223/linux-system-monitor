#!/bin/bash

#CPU Usage#

Total_CPU_usage= $(top -bn1 | awk '/Cpu/ {print 100-$8}')
echo "Total CPU usage: $Total_CPU_usage%"


#Memory usage#
Total_Memory_usage= $(free -g | awk '/Mem/ {print $3/$2 * 100.0}')
echo "Total Memory usage: $Total_Memory_usage%" 

#Total Used disk space#
Total_Disk_usage= $(df -h | awk '/\/$/ {print $3/$2 * 100.0}')
echo "Total Disk usage: $Total_Disk_usage%" 


#top 5 processes by CPU usage#
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6

#top 5 processes by memory usage#
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6
