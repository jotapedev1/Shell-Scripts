#!/bin/bash

imageConversion(){
	image_path=$1
	image_name=$(ls $image_path | awk -F'\.' '{ print $1 }')
	convert $image_name.jpg $image_name.png
}

directorySearch(){
	#passamos como parametro o diretorio raiz das imagens
	cd $1
	#percorre tudo a partir desse diretorio atual
	for file in *
	do
		#esse comando devolve o caminho completo de um diretorio ou arquivo
		file_path=$(find ~/Downloads/imagens-novos-livros/ -name $file)
		if [ -d $file_path ]
		then
			directorySearch $file_path
		else
			imageConversion $file_path
		fi
	done
}

directorySearch ~/Downloads/imagens-novos-livros
if [ $? -eq 0 ]
then
	echo "Conversion finished"
else
	echo "Conversion failed"
fi

