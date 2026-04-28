#!/bin/bash

cd ~/Scripts/LogSearch/

if [ -z $1 ]
then
	while [ -z $parameter ]
	do
		read -p "Use a parameter (POST, DELETE, PUT, GET): " parameter
		userReq=$(echo $parameter | awk '{ print toupper($1) }')
	done
else
	userReq=$(echo $1 | awk '{ print toupper($1) }')
fi

case $userReq in
	GET)
	cat apache.log | grep GET
	;;
	PUT)
	cat apache.log | grep PUT
	;;
	DELETE)
	cat apache.log | grep DELETE
	;;
	POST)
	cat apache.log | grep POST
	;;
	*)
	echo "Invalid parameter"
	;;
esac
