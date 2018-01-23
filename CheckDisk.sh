#!/bin/bash
# MAX 定義 Disk 容量做多為多少
MAX=95
EMAIL=s14113242@stu.edu.tw

read -p "輸入要檢查的Disk : " PART

test -z $(df | awk 'NF=1 && NR>1 {print $1}' | grep "$PART")  && echo "Can not find this hard disk" && exit 0

USE=$(df -h |grep "$PART" | awk '{ print $5 }' | cut -d'%' -f1)

if [ $USE -gt $MAX ]; then
        echo "Percent used: $USE%" | mail -s "Disk space is out of range $MAX%" $EMAIL
else
        echo "None out of range $MAX%"
        echo "Percent used: $USE%"
fi
