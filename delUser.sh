#!/bin/bash
read -p "Input username: " user

id $user &>/dev/null

if [ $? -ne 0 ];then
    echo "no such user: $user"
    exit 1
fi

read -p "Are you sure?[y/n]: " action

case "$action" in
y|Y)
    userdel -r $user && echo "$user is del."
    ;;
*)
    echo "Please input [y/Y] or n"
esac