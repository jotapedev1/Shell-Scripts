#!/bin/bash

restorePath=/home/jotape/Scripts/RestoreAmazon/restored

aws s3 sync s3://{"Bucket-Name"}/$(date +%F) $restorePath

cd $restorePath
if [ -f $1.sql ]
then
	mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "Restore finished"
	fi
else
	echo "File not found in directory"
fi


