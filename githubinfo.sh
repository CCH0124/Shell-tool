#!/bin/bash

if [ $# -ne 1 ]; then
        echo "執行方式: $0 <username>"
        exit 1
fi

curl -s "https://api.github.com/users/$1" | \
        awk -F'"' '/ \"name\"/ { # 符合 name 字串的第 4 個位置印出
                print $4 "Github User Name"
        }
        / \"location\"/ {
                print "Country "$4""
        }
        /\"followers\":/{
                split($3, a, " ")
                sub(/,/, "", a[2])
                print ""a[2]" followers"
        }
        /\"following\":/{
                split($3, a, " ")
                sub(/,/, "", a[2])
                print ""a[2]" other users are being followed"
        }
        /\"created_at\":/{
                print "Account was established on "$4""
        }
        '
