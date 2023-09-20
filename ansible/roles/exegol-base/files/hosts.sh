#!/bin/bash

#set -x

InitColor="\033[0m"
Black="\033[30m"
Red="\033[31m"
Green="\033[32m"
Yellow="\033[33m"
Blue="\033[34m"
Magenta="\033[35m"
Cyan="\033[36m"
White="\033[37m"

function add_host {
    ip=$1
    shift
    hosts=("$@")
    echo -e "${Green}$ip${InitColor} ${Blue}${hosts[*]}${InitColor}"
    if grep -q "^${ip} " /etc/hosts; then
        sed -i "s/^${ip}[ ]+/${ip}   ${hosts[*]}/" /etc/hosts 2> /dev/nul
    else
        echo "$ip   ${hosts[*]}" >> /etc/hosts
    fi
}

# add custom hosts names here
# ex: 
# add_host 10.10.11.206    qreader.htb
