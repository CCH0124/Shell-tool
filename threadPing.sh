#!/bin/bash
thread=5
tmp_fifofile=/tmp/$$.tmp_fifofile

mkfifo $ tmp_fifofile
exec 8<> $tmp_fifofile
rm $tmp_fifofile

for i in $(seq $thread)
do
    echo >&8
done

for i in {1..254}
do
    read -u 8 # 讀到執行，否則等待
    {
    ip=192.168.122.$1
    ping -c1 -W1 $ip &>/dev/null
    if [ $? -eq 0 ];then
        echo "$ip is up."
    else
        echo "$ip is down."
    fi
    echo >&8 # 釋放
    }&
done
wait
echo "finished.."