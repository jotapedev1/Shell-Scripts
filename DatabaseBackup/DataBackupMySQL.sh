#!/bin/bash

bkpPath=/home/jotape/Scripts/DatabaseBackup
cd $bkpPath

if [ ! -d backup ]
then
	mkdir backup
fi

mysqldump -u root $1 > $bkpPath/backup/$1.sql

if [ $? -eq 0 ]
then
	echo "Backup finished"
else
	echo "Something went wrong"
fi
