#!/bin/bash
#Descompresion
##Se pasaran dos archivos comprimidos por parametro

if ! [ $# -eq 2 ]
then
	echo "se necesitan dos argumentos"
	exit 1
fi

TAR=$1
[ ! -e $TAR ] && echo "Archivo $TAR no existe!!" && exit 2
[ ! -f $TAR ] && echo "$TAR no es un archivo regular!!" && exit 3

CHECKSUM=$2
CHECKSUM_NUEVO=$(md5sum $TAR)
echo "CHECKSUM NUEVO: $CHECKSUM_NUEVO"
[ ! $CHECKSUM_NUEVO = $CHECKSUM ] && echo "Ocurrio un error en el checksum" && exit 4

tar xvf $TAR
echo "El tar $TAR se descomprio correctamente"
exit 0
