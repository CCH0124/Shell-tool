#!/bin/bash

read -p "Input username: " user
read -p "Input Passwd: " pwd

if [[ "$user" =~ ^[0-9]+$ ]];then
    echo "Can not just enter numbers."
    exit 0
fi

if [ -z "$user" -o -z "$pwd" ];then
    echo "Don't empty."
    exit 0
fi


useradd $user
echo "$pwd" | passwd --stdin $user &>/dev/null

if [ $? -eq 0 ];then
    echo "$user is created."
fi