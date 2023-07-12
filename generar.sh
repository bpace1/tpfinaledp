#!/bin/bash
#init: none -> string string
#marca el inicio de este archivo mediante la repeticion de guiones medios.
init(){
	echo -------------------------------------------------------
	echo "Se iniciará el proceso de generación y compresión de imágenes."

}
#downloadNames: none -> string
#descarga la lista de nombres posibles a nuestro directorio actual con el nombre "possibleNames".
downloadNames() {
	curl -s -o possibleNames https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
	echo "Se descargó el archivo de nombres"
}

#selectName: none -> string (name)
#selecciona un nombre de forma aleatoria del archivo de nombres posibles.
selectName(){
	cad=$( (sort -R possibleNames | head -n1) | cut -d "," -f-1 )
	echo $cad
}


#generateImages: number -> none
#genera las imagenes y las guarda con un nombre del archivo de forma aleatoria.
generateImages(){
	mkdir -p tuia/dir/
	echo "Indique la cantidad de imagenes que quiere descargar y presione enter:"
	read CMD
	if [[ $CMD =~ ^[0-9]+$ ]]; then
		for i in $(seq $CMD)
	       		do
				nombre=$(selectName)
				echo "Descargando imagen $i."
				curl -o "tuia/dir/$nombre" -L -s  https://source.unsplash.com/random/900%C3%97700/?person
				echo "Imagen $i) $nombre  descargada."
			done
		else echo "No es un número"
	fi
}

#compress: none -> string
#comprime un archivo.
compress(){
	tar -zcf tuia/imgCompressed.tar.gz tuia/dir/
	echo "Se comprimió el archivo." 
}

#validationMark: none -> file
#genera el archivo con la suma de verificacion del archivo comprimido.
validationMark(){
	 md5sum tuia/imgCompressed.tar.gz > tuia/imgCompressed.tar.gz.sum
	 echo "Se generó un archivo con la suma de validación."
	
}

#end: none -> string string
#marca el fin del proceso de generacion y compresion de imagenes con un mensaje
#y una sucesion de guiones medios
end(){
	echo "Fin de Proceso de generación y compresión de imágenes."
	echo -------------------------------------------------------
	exit 0
}

#main: none -> none
#main llama a las funciones de este script en el orden establecido para cumplir con nuestro fin.
main (){
	init
	downloadNames
	generateImages
	compress
	validationMark
	end
}
main
