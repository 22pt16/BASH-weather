#!/bin/bash

#DATE: 26-02-2024
#OWNER: MIDHU
tput setaf 6;echo -e '\t\t\t\t ☁️ ☁️ ☁️ ☁️ Welcome to weather application ☁️ ☁️ ☁️ ☁️ ';tput sgr0
sleep 1

#-----------------------functions-------------------

get_current_location()
{

	#echo "check for correctness (y/n)"

	city=$(awk -F'[:,]' '/city/{gsub(",", "", $2); print $2}' json |head -1)
	region=$(awk -F'[:,]' '/region/{gsub(",", "", $2); print $2}' json |head -1)
	#loc=$(awk -F'[:,]' '/loc/{gsub(",", "", $2); print $2}' json |head -1)
	loc=$(awk -F':' '/loc/{gsub(",", "", $2); print $2}' json | head -1)

	echo "Displaying the current Location "
	# Format the output
	tput setaf 3;echo -e "\nCurrent Location Information:";tput sgr1
	echo "-----------------------------"
	echo "City:    $city"
	echo "Region:  $region"
	IFS=',' read -ra loc_array <<< "${loc:0:7},${loc:7}"
	echo "Loc:     Latitude - ${loc_array[0]}, Longitude - ${loc_array[1]}"; tput sgr0
	echo "check for correctness (y/n)"

	read o
	if [[ $o -eq "y" ]];then
		clear
		echo "proceeding.."
	fi

}

get_weather_forecast()
{
	if [[ -f $city ]]; then
		rm *$city.*
	fi

        echo -e "Weather report iS available only for NEXT 3 Days\nLoading.."
        sleep 2
        wget https://wttr.in/$city
        sed -i '$ d' $city
        cat $city

}


get_current_weather()
{
	if [[ -f $city ]]; then
		rm *$city.*
	fi

        wget https://wttr.in/$city
        sed -i '$ d' $city
        c=$(date +'%d')
#        awk -v date="$c" '/^ *[┌│]/{f=0} f; $0 ~ date{f=1; print p; print $0} {p=$0}' $city
	#awk '/"$c"/,/^└/' $city
	clear
	echo -e "CURRENT WEATHER for : $city\n"
	cat $city |head -7

	echo -e "\nDo you want extended REPORT for $date?  (y/n) :"
	read op

	if [[ $op -eq "y" ]]; then
		echo "Here it is ......"
		echo -e "TODAY'S WEATHER REPORT for : $city\n"

		sleep 1
#TO PRINT REQUIRES FORECAST"
	awk -v date="$c" '/^ *[┌│]/{f=0} f; $0 ~ date{f=1; print p; print $0} {p=$0}' $city
	awk '/Wed 06 Mar/,/^└/' $city | sed -n '/Morning/,/Night/p'

	else
		echo "EXITING....."
	fi
}




#-------------------------------GET LOCATION-------------------------------------
#get ip and store it in file "myip"

ip=$(wget --default-page=myip https://ipinfo.io/)
#echo -e "my ip is : $ip "

#if myip  alrdy exists then take the next iter filename as currfile
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

sleep 3
clear
#echo "Current IP file is: $curripfile"         #DE-REFERENCING FILENAME
tput setaf 6;echo -e '\t\t\t\t ☁️ ☁️ ☁️ Welcome to weather application ☁️ ☁️ ☁️ ☁️ '
sleep 2
tput setaf 1;echo -e "⚠️  🚩WE REQUIRE IP PERMISSION FOR FORECASTING !!!\n";tput sgr0
echo "Click 'y' to continue :"
read o

if [[ $o -eq "y" ]] ; then

tput setaf 3; echo -e "Fetching your Ip... through API\n..." ;tput sgr0
sleep 3
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

fi

#-------------------------------------------GET IP------------------------------
clear
echo "Found your IP!!"
sleep 2
ip=$(awk -F'[:,]' '/ip/{gsub(",", "", $2); print $2}' json |head -1)
echo -en "\n MY IP: $ip\n"

#remove exisitng files


rm -f *myip.*

# opt = '1'


#---------------------------------MAIN-----------------------------------
#echo -en "\n\nEnter the options\n"
tput setaf 5;echo -e "\t\t\t\t\t\t ☁️ ☁️ ☁️ Welcome to Weather Forecasting Tool !!☁️ ☁️ ☁️ ☁️ " ;tput sgr1
sleep 2
echo "Would you like to provide your own location? (y/n)"
read choice ;tput sgr0

sleep 2

if [[ $choice == "y" ]]; then
    echo "Enter your location (city, country): "
    read city
else
	echo "OK...🍃"
	echo "༄  ༄ ...Fetching current location"
	sleep 1
	echo "Hold Tight...🌫 🌫  "
	sleep 2
	clear
    get_current_location

fi

echo "Here's "
sleep 1
echo "your options.."
sleep 1
echo -e "\nChoose an option:"
echo "1. Get current weather"
echo -e "2. Get weather forecast\n:"
read option

case $option in
    1)
#        current_weather=$(get_current_weather )
        echo "Current weather for $city:"
#        echo "$current_weather"
	get_current_weather

        ;;
    2)
#        forecast=$(get_weather_forecast )
        echo "Weather forecast for $city:"
 #       echo "$forecast"
	get_weather_forecast
        ;;
    *)
        echo "Invalid option"
        ;;
esac

#----------------------cmnts----------------



