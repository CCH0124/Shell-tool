#!/bin/bash

declare -A status
type=$(ss -an | grep :80 | awk '{print $2}')

while :
do
    for i in $type
    do
        let status[$i]++
    done

    for j in ${!status[@]}
    do
        echo "$j: ${status[$j]}"
    done
    sleep 1
done