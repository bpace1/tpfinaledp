#!/bin/bash
#Descompresion

#init: none -> string string
#marca el inicio de este archivo mediante la repeticion de guiones medios.
init(){
        echo -------------------------------------------------------
        echo "Se iniciará el proceso de descompresión de imágenes."

}


#validarParametros: file file -> none
#Se pasaran dos archivos comprimidos por parametro
#Se valida que se pasan 2 argumentos
#Se valida que el primer argumento sea un archivo que existe y sea regular
validarParametros(){
	if ! [ $# -eq 2 ]
	then
        	echo "ERROR: se necesitan dos argumentos"
        	exit 1
	fi

	TAR=$1
	[ ! -e $TAR ] && echo "Archivo $TAR no existe!!" && exit 2
	[ ! -f $TAR ] && echo "$TAR no es un archivo regular!!" && exit 3

}

#validarChecksum: file -> none
#Se comparan los checksum y se avise de un error en caso de diferir
validarChecksum(){
	CHECKSUM=$2
	CHECKSUM_NUEVO=$(md5sum $TAR)
	echo "CHECKSUM NUEVO: $CHECKSUM_NUEVO"
	[[ ! $CHECKSUM_NUEVO == $CHECKSUM ]] && echo "Ocurrio un error en el checksum" && exit 4
}


#descomprimirTar: file -> string
#Se descomprime el archivo TAR
descomprimirTar(){
	tar xvf $TAR
	echo "El tar $TAR fue descomprimido correctamente"
	exit 0
}

#end: none -> string string
#marca el fin del proceso de generacion y compresion de imagenes con un mensaje
#y una sucesion de guiones medios
end(){
        echo "Fin de descompresión de imágenes."
        echo -------------------------------------------------------
}

#main: none -> none
#se llaman a todas las funciones en el orden necesario para cumplir con nuestro fin.
main(){
	init
	validarParametros
	validarChecksum
	descomprimirTar
	end
}

main
