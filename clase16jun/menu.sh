#!/bin/bash

read CMD
menu (){
	echo "Ingrese un comando de la siguiente lista:"
	echo "Descargar"
	echo "Generar"
	echo "Procesar"
	echo "Comprimir"
	if [[ CMD  =~ +[A-Ba-B]$ ]] ; then
		case expresion in
			descargar)
				echo "Se descargarán las imágenes de la web"
				descargar.sh #ver como ejecutar otro archivo .sh dentro de uno.
			;;
			generar)
				echo "Se están generando las imágenes"
				generar.sh
			;;
			procesar)
				echo "Se están procesando las imágenes"
			;;
			comprimir)
				echo "Se están comprimiendo los archivos"
				comprimir.sh 
		esac
	else 
		echo "No es un comando valido"
	fi

}
