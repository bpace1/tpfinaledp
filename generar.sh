#!/bin/bash

#downloadNames: none -> string
#descarga la lista de nombres posibles a nuestro directorio actual con el nombre "possibleNames".
downloadNames() {
	curl -s -o possibleNames  https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv
	echo "Se descargó el archivo de nombres."
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
	mkdir -p dir/
	echo "Indique la cantidad de imagenes que quiere descargar:"
	read CMD
	if [[ $CMD =~ ^[0-9]+$ ]]; then
		for i in $(seq $CMD)
	       		do
				nombre=$(selectName)
				curl -o "dir/$nombre" -L -s  https://source.unsplash.com/random/900%C3%97700/?person
				echo "Imagen $i) $nombre  descargada."
			done
		else echo "No es un número"
	fi
}

#compress: none -> string
#comprime un archivo.
compress(){
	tar -zcf imgCompressed.tar.gz dir/
	echo "Se comprimió el archivo." 
}

#validationMark: none -> file
#genera el archivo con la suma de verificacion del archivo comprimido.
validationMark(){
	 md5sum imgCompressed.tar.gz > imgCompressed.tar.gz.sum
	 echo "se generó un archivo con la suma de validación."
	
}

#main: none -> none
#main llama a las funciones de este script en el orden establecido para cumplir con nuestro fin.
main (){
	downloadNames
	generateImages
	compress
	validationMark
}
main
