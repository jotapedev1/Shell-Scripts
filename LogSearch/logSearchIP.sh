#!/bin/bash

cd ~/Scripts/LogSearch/

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
if [[ $1 =~ $regex ]]
then
	cat apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo "IP address not found in the file"
	fi
else
	echo "Invalid IP address"
fi

