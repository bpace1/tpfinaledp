#!/bin/bash -xe

#downloadNames: none -> none
#descarga la lista de nombres posibles a nuestro directorio actual con el nombre "possibleNames".
downloadNames() {
	$(curl -o possibleNames  https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv)
	echo "Se descargó el archivo de nombres"
}

#selectName: none -> string (name)
#selecciona un nombre de forma aleatoria del archivo de nombres posibles.
selectName(){
	echo $( sort -R possibleNames | head -n1 )
}

#generateImages: none -> none
#genera las imagenes y las guarda con un nombre del archivo de forma aleatoria.
generateImages(){
	echo "Indique la cantidad de imagenes que quiere descargar:"
	read CMD
	if [[ $CMD =~ ^[0-9]+$ ]]; then
		for i in $(seq $CMD)
	       		do
				nombre=$(selectName)
				$(curl -o "$nombre" -L  https://source.unsplash.com/random/900%C3%97700/?person)
				echo "imagen $i descargada"
			done
		else echo "No es un número"
	fi
}
main (){
	downloadNames
	generateImages
}
main
