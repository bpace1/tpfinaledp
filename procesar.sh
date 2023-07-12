#!/bin/bash


#init: none -> string string
#marca el inicio de este archivo mediante la repeticion de guiones medios y un mensaje.
init(){
        echo -------------------------------------------------------
        echo "Se iniciará el proceso del archivo procesar"

}



#Recorre las imagenes que se encuentran en la carpeta 'dir'
#Y en caso de que la imagen tenga un nombre válido
#Se le da la resolución 512x512
process(){
	echo "Inicio de filtrado de nombres y redimensión de imagenes."
	mkdir -p dir
	for FILE in ./dir/*
	do
		#Obtenemos el nombre sin la ruta './dir/'
		NOMBRE=${FILE:6}
		echo $NOMBRE
		#Si pasa el regex de nombre valido se convierte la imagen
		if [[ $NOMBRE =~ ^[A-Z]{1}[a-z]+(([ ]{1}[A-Z]{1}[a-z]+)?)$ ]]
			then	
				convert "$FILE" -resize 512x512! "$FILE"
			convert "$FILE" -gravity center -resize 512x512+0+0 -extent 512x512 "$FILE"
		fi

	done
	echo "Las imagenes Fueron procesadas."
	
}

#end: none -> string string
#marca el fin del proceso del archivo procesar.
end(){
        echo "Fin de proceso de archivo procesar"
        echo -------------------------------------------------------
	exit 0
}

#main: none -> none
#agrupa todas las funciones en el orden correspondiente
main(){
	init
	process
	end
}
main

