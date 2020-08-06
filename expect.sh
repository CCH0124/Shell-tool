#!/bin/expect
IP=$1
pwd=$2
spawn ssh itachi@$IP

expect {
    "yes/no" { send "yes\r"; exp_continue } # "yes/no" 出現的字串 {} 相對應動作
    "password:" { send "$pwd\r" }
}

interact # 與對方互動