#!/bin/bash


menu (){
	echo "Ingrese un comando de la siguiente lista:"
	echo "1 para Generar imagenes" 
	echo "2 para Procesar imagenes"
	echo "3 para descargar imagenes"
	echo "4 para Comprimir imagenes"
	read CMD
	if [[ $CMD  =~ ^[1-4]$ ]] ; then
		case $CMD in
			3)
				echo "Se descargarán las imágenes de la web"
				#descargar.sh #ver como ejecutar otro archivo .sh dentro de uno.
			;;
			1)
				echo "Se están generando las imágenes"
				#generar.sh
			;;
			2)
				echo "Se están procesando las imágenes"
				#procesar.sh
			;;
			4)
				echo "Se están comprimiendo los archivos"
				#comprimir.sh 
			;;
		esac
	else 
		echo "No es un comando valido"
	fi

}

menu
