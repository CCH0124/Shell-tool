#!/bin/bash
mem_used=$(free -m | grep '^Mem:' | awk '{print $3}')
mem_total=$(free -m | grep '^Mem:' | awk '{print $2}')
mem_percent=$((mem_used*100/mem_total))
warn_file=/tmp/mem_warn.txt

if [ $mem_percent -gt 85 ];then
    echo "$(data +%F-%H) memory:${mem_percent}%" > $warn_file
fi