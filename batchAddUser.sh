#!/bin/bash
#######
# 給一個含有帳號與密碼的文件輸入
# example:
# user1 passwd1
#######
while read line
do
    if [ ${#line} -eq 0 ];then
        continue
    fi
    user=$(echo $line | awk '{print $1}')
    pwd=$(echo $line | awk '{print $2}')
    id $user &>/dev/null
    if [ $? -eq 0 ];then
        echo "user $user already exists."
    else
        useradd $used
        echo "$pass" | passwd --stdin $user &>/dev/null
        if [ $? -eq 0 ];then
            echo "$user is create"
        fi
    fi
    
done < $1