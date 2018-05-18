#!/bin/bash
printPID(){
        if [ -n "$1" ]; then
                echo $1
        else
                echo "Not Found"
        fi
}
getPID(){
        PID=$(ps auxw | grep $1 | grep -v grep | awk '{print $2}')
}
if [ $# -ne 1 ]; then
        echo "Usage: $0 Service Name"
        exit 1
fi

getPID $1
printPID $PID
