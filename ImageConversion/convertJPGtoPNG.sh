#!/bin/bash

imageConversion(){
	cd ~/Downloads/imagens-livros
	if [ ! -d png ]
	then
		mkdir png
	fi

	for image in *.jpg
	do
		fileName=$(ls $image | awk -F. '{ print $1 }')
		convert $fileName.jpg png/$fileName.png
	done
}

imageConversion 2>errorLogs.txt

if [ $? -eq 0 ]
then
	echo "File conversion succeed"
else
	echo "File cnoversion failed"
fi
