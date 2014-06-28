#!/bin/bash
while read line
do
count=$(echo $line|awk '{print $1}')
ip=$(echo $line|awk '{print $2}')
if [ $count -gt 10 ]
then
	echo "$ip detected"
fi
#echo $ip
done<txt
