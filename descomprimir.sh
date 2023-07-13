#!/bin/bash
#Descompresion
##Se pasaran dos archivos comprimidos por parametro


CANTIDAD_ARGUMENTOS=$#
TAR=$1
CHECKSUM=$2

#init: none -> string string
#marca el inicio de este archivo mediante la repeticion de guiones medios.
init(){
        echo -------------------------------------------------------
        echo "Se iniciará el proceso de descompresión de imágenes."

}


#validarParametros: file file -> none
#Se pasaran dos archivos comprimidos por parametro
#Se valida que se pasan 2 argumentos
validarCantidadParametros(){
	if ! [ $CANTIDAD_ARGUMENTOS -eq 2 ]
	then
        	echo "se necesitan dos argumentos"
        	echo "ERROR: se necesitan dos argumentos"
        	exit 1
	fi
}

#se valida que los archivos que se pasen por parametro no esten vacios
#se valida que el archivo comprimido exista
validarTar(){
	[ "$TAR" == "" ] || [ "$CHECKSUM" == "" ] && echo "No se admiten argumentos vacios!!" && exit 5
	[ ! -e $TAR ] && echo "Archivo $TAR no existe!!" && exit 2
	[ ! -f $TAR ] && echo "$TAR no es un archivo regular!" && exit 3

}


#validarChecksum: file -> none
#se valida que el archivo que contiene el checksum exista
#Se comparan los checksum y se avisa de un error en caso de diferir

validarChecksum(){
	[ ! -e $CHECKSUM ] && echo "Archivo $CHECKSUM no existe!!" && exit 6
        [ ! -f $CHECKSUM ] && echo "$CHECKSUM no es un archivo regular!!" && exit 7
	CHECKSUM_NUEVO=$(md5sum $TAR)
        [[ ! $CHECKSUM_NUEVO == $(cat $CHECKSUM) ]] && echo "Ocurrio un error en el checksum" && exit 4
}

#Se descomprime el archivo TAR
descomprimirTar(){
	tar xvf $TAR
	echo "El tar $TAR se descomprio correctamente"
}

#descomprimirTar: file -> string
#Se descomprime el archivo TAR
descomprimirTar(){
	tar xf $TAR
	echo "El tar $TAR fue descomprimido correctamente"
}

#end: none -> string string
#marca el fin del proceso de generacion y compresion de imagenes con un mensaje
#y una sucesion de guiones medios
end(){
        echo "Fin de descompresión de imágenes."
        echo -------------------------------------------------------
	exit 0
}

#main: none -> none
#se llaman a todas las funciones en el orden necesario para cumplir con nuestro fin.
main(){
	init
	validarCantidadParametros
	validarTar
	validarChecksum
	descomprimirTar
	end
}

main
