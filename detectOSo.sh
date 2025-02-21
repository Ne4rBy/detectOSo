#!/bin/bash

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"

# Banner
figlet -f slant "detectOSo" | lolcat
echo -e "${greenColour}Created by: Samuel Laveau (aka Ne4rby)${endColour}\n"

# Handle Ctrl+C
trap ctrl_c INT
ctrl_c() {
    echo -e "\n${redColour}[!] Exiting...${endColour}"
    exit 1
}

function help_panel() {
    echo -e "\n${redColour}[!] Usage:${endColour} $0 <IP-Address>"
    echo -e "\n${yellowColour}[!] Example:${endColour} $0 192.168.1.1"
    echo -e "\n${greenColour}[+] Description:${endColour} This script checks if an IP is up and determines OS based on TTL.\n"
    exit 1
}

if [ $# != 1 ]; then
    echo -e "\n${redColour}[!] Error: Missing IP address argument.${endColour}"
    help_panel
fi

# Assign the first argument as the IP
IP=$1

# Validate IP format
if ! [[ $IP =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo -e "\n${redColour}[!] Error: Invalid IP format.${endColour}"
    help_panel
fi

# Extract TTL value from ping response
ttl_value=$(ping -c 1 $IP | grep ttl | awk '{print $6}' | awk -F'=' '{print $2}')

if [[ -n $ttl_value ]]; then
    echo -e "\n${blueColour}[+] $IP - UP${endColour}"

    if [[ $ttl_value -le 64 ]]; then
        echo -e "${greenColour}[+] TTL: $ttl_value - Linux/Unix${endColour}"
    elif [[ $ttl_value -ge 65 && $ttl_value -le 128 ]]; then
        echo -e "${yellowColour}[+] TTL: $ttl_value - Microsoft Windows${endColour}"
    else
        echo -e "${redColour}[+] TTL: $ttl_value - Unknown OS${endColour}"
    fi

else
	
    echo -e "\n${redColour}[!] $IP - DOWN or Blocking ICMP Probes${endColour}"
fi
