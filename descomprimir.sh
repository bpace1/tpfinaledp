#!/bin/bash
#Descompresion
##Se pasaran dos archivos comprimidos por parametro

#Se valida que se pasan 2 argumentos
#Se valida que el primer argumento sea un archivo que existe y sea regular
validarParametros(){
	if ! [ $# -eq 2 ]
	then
        	echo "se necesitan dos argumentos"
        	exit 1
	fi

	TAR=$1
	[ ! -e $TAR ] && echo "Archivo $TAR no existe!!" && exit 2
	[ ! -f $TAR ] && echo "$TAR no es un archivo regular!!" && exit 3

}

#Se comparan los checksum y se avise de un error en caso de diferir
validarChecksum(){
	CHECKSUM=$2
	CHECKSUM_NUEVO=$(md5sum $TAR)
	echo "CHECKSUM NUEVO: $CHECKSUM_NUEVO"
	[[ ! $CHECKSUM_NUEVO == $CHECKSUM ]] && echo "Ocurrio un error en el checksum" && exit 4
}

#Se descomprime el archivo TAR
descomprimirTar(){
	tar xvf $TAR
	echo "El tar $TAR se descomprio correctamente"
	exit 0
}

main(){
	validarParametros
	validarChecksum
	descomprimirTar
}

main
