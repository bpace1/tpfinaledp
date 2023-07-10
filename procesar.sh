#!/bin/bash

#Recorre las imagenes que se encuentran en la carpeta 'dir'
#Y en caso de que la imagen tenga un nombre válido
#Se le da la resolución 512x512

for FILE in ./dir/*
do
	#Obtenemos el nombre sin la ruta './dir/'
	NOMBRE=${FILE:6}

	#Si pasa el regex de nombre valido se convierte la imagen
	if [[ $NOMBRE =~ ^[A-Z]{1}[a-z]+(([ ]{1}[][A-Z]{1}[a-z]+)?)$ ]]
		then	
		convert "$FILE" -resize 512x512! "$FILE"
	fi

done
exit 0
