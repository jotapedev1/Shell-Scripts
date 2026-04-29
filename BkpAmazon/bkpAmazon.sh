#!/bin/bash

bkpPath=/home/jotape/Scripts/BkpAmazon/bkp
cd $bkpPath

date=$(date +%F)

if [ ! -d $date ]
then
	mkdir $date
fi

tables=$(sudo mysql mutillidae -e "show tables;" | grep -vi tables)

for table in $tables
do
	mysqldump -u root mutillidae $table > $bkpPath/$date/$table.sql
done

aws s3 sync $bkpPath s3://{"bucket-name"}
