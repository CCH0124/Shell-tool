#!/bin/bash
Usage() {
        echo "Usage: $(basename $0) [options]"
        echo
        echo "OPTIONS:"
        echo "  -b RSA Key size"
        echo "  -h Client Ipaddress"
        echo "  -u Client User Name"
}
$(mkdir -p $HOME/.ssh)
$(chmod 0700 $HOME/.ssh)
LENGTH=0
HOST=0
USER=0

while getopts "b:h:u:?" argv
do
        case $argv in
                b)
                        LENGTH=1
                        BIT="${OPTARG}"
                        ;;
                h)
                        HOST=1
                        IP="${OPTARG}"
                        ;;
                u)
                        USER=1
                        USERNAME="${OPTARG}"
                        ;;
                ?)
                        Usage
                        exit 0
        esac
done

if [ "$LENGTH" == "1" -a "$HOST" == "1" -a "$USER" == "1" ]; then
        echo -e "\n\n" | ssh-keygen -t rsa -b $BIT -N "" -q > /dev/null
        ssh-copy-id -i $HOME/.ssh/id_rsa.pub $USERNAME@$IP > /dev/null
        exit 0
else
        Usage
        exit 0
fi
