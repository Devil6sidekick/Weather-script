#!/bin/bash

#Create the raw data file: raw-data-YYYY-MM-DD
weather_today=$(date "+%Y-%m-%d")
city="Casablanca"
wget -O weather-raw-data-$weather_today.txt wttr.in/$city  

#Filter the temperatures from the data file
grep °C raw-data-$weather_today.txt > temperatures.txt
obstemp=$(cat temperatures.txt | head -n 1 | cut -d "+" -f2 | cut -c 1-2,28-29)
 foctemp_noon=$(cat temperatures.txt | head -n 2 | tail -n 1 | cut -d "+" -f3 | cut -c 1-2,28-29)
 
 #print results of temp
echo "observed temp is $obstemp, and estimated temp tomorrow att noon is $foctemp_noon"

#Add the results along with the date to the table in poc.log
Year=$(date "+%Y")
month=$(date "+%m")
day=$(date "+%d")
hour=$(date "+%H")
echo -e "$Year |$month    |$day  |$hour   |$obstemp          |$foctemp_noon" >> poc.log
