#!/bin/bash

if [ ! -d log ]
then
	mkdir log
fi

memoryProcess(){
	processId=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

	for pid in $processId
	do
		processName=$(ps -p $pid -o comm=)
		echo -n "$(date +%F,%H:%M:%S,)" >> "log/$processName.log"
		processSize=$(ps -p $pid -o size | grep [0-9])
		echo "$(bc <<< "scale=2;$processSize/1024") MB" >> "log/$processName.log"
	done
}

memoryProcess

if [ $? -eq 0 ]
then
	echo "Logs created successfully"
else
	echo "Something went wrong"
fi
