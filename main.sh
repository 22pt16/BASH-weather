#!/bin/bash

#DATE: 26-02-2024
#OWNER: MIDHU
echo 'Welcome to weather application'

#get ip and store it in file "myip"
ip=$(wget  --default-page=myip https://ipinfo.io/ | awk -F'"' '/ip/{print $4}')

#if myip is alrdy there trhen take the next iter filename as currfile

i=0
while [[ -e "myip.$i" || ($i -eq 0 && -e "myip") ]]; do
    ((i++))
done
((i--))
# store the current file
curripfile="myip.$i"
echo "Current IP file is: $curripfile"
#prints the file
cat $curripfile
