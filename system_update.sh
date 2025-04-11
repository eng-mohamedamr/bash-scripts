#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 
path="/var/log/system_update.log"
seperator(){
echo -e "${BLUE}==========================================================================================${NC}" >> "$path"
echo -e "${GREEN}                         $(date +"%Y-%m-%d %H:%M:%S")                                    ${NC}" >> "$path"
echo -e "${BLUE}==========================================================================================${NC}" >> "$path"
}
updates(){
    sudo apt update ; sudo apt upgrade >> $path
}
 logs(){
    sudo journalctl -p err >> $path
    }
seperator
updates
seperator
logs 
