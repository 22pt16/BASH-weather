#!/bin/bash

#DATE: 26-02-2024
#OWNER: MIDHU
echo 'Welcome to weather application'


#-------------------------------GET LOCATION-------------------------------------
#get ip and store it in file "myip"

#ip=$(wget --default-page=myip https://ipinfo.io/ | awk -F: -v RS=',\n' '/"ip"/{print $2}')
ip=$(wget --default-page=myip https://ipinfo.io/)
#echo -e "my ip is : $ip "

#if myip is alrdy exists then take the next iter filename as currfile
i=0
while [[ ($i -eq 0 && -e "myip") || -e "myip.$i" ]];
do
    ((i++))
done

((i--))

# store the current file
if [ $i -eq 0 ]
then
        curripfile="myip"
else
        curripfile="myip.$i"
fi

clear
#echo "Current IP file is: $curripfile"         #DE-REFERENCING FILENAME
echo 'Welcome to weather application'

#--------------------------PRINT JSON FILE-----------------------

#file=$(<"$curripfile")         #printing original content of file
#echo "file"
#echo "the content are : "
#echo "$file"

#DLTE 1ST AND LAST LINE
sed -i '$ d' $curripfile
sed -i '1,1d' $curripfile

#echo "after deleting $file"
#DLTE QUOTES
tr -d '"' < "$curripfile" | sed 's/ //g' > "json"

#PRINT ONLY IP
#file=$(<"json")
#echo "the new content are : "
#echo "$file"

#-------------------------------------------GET IP------------------------------
ip=$(awk -F'[:,]' '/ip/{gsub(",", "", $2); print $2}' json |head -1)
echo -en "\n MY IP: $ip\n"

#remove exisitng files
rm -f *myip.*

# opt = '1'
#---------------------------------MAIN-----------------------------------
echo -en "\n\nEnter the options\n"

