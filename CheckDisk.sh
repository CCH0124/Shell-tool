#!/bin/bash
MAX=95 # 定義最大硬碟使用
EMAIL=s14113242@stu.edu.tw

PART=sda1

USE=$(df -h |grep "$PART" | awk '{ print $5 }' | cut -d'%' -f1)

if [ $USE -gt $MAX ]; then
        echo "Percent used: $USE%" | mail -s "Disk space is out of range $MAX%" $EMAIL
else
        echo "None out of range $MAX%"
        echo "Percent used: $USE%"
fi
