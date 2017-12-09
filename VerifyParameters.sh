#!/bin/bash
#verifyParameters -- 確認輸入的資料只包含英文字母及數字

verifyParameters(){ #驗證參數: 參數是由大小寫或數字組成 回傳 0 否則 1
#移除不符合的字元
        vaildchars="$(echo $1 | sed -e 's/[^[:alpha:]]//g')" # -e 直接在指令列模式上進行 sed 的動作編輯

        if [ "$vaildchars" = "$1" ]; then
                return 0
        else
                return 1
        fi
}

#==========================main===================================
/bin/echo -n "請輸入資料: "

#輸入內容進行驗證

read input
if verifyParameters "$input" ; then
        echo "輸入有效資料"
else
        echo "只能使用大小寫英文" >&2
        exit 0
fi
exit 0
