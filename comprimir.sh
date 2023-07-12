#!/bin/bash

#init: none -> string string
#marca el inicio de este archivo mediante la repeticion de guiones medios.
init(){
        echo -------------------------------------------------------
        echo "Se iniciará el proceso del archivo comprimir"

}


#getNames: none -> file string
#se encarga de hacer la lista de los nombres que toman las imagenes en un archivo listNames
getNames(){
#	mkdir -p dir2/
	ls dir | grep .jpg | cut -d "." -f-1  > dir2/listNames
	echo "Archivo de todos los nombres de imágenes generado."
}

#getValidNames: none -> file string
#se encargade hacer la lista de los nombres validos que toman las imagenes en un archivo listValidNames
getValidNames(){
	ls dir2 | grep .jpg | cut -d "." -f-1  > dir2/listValidNames
	echo "Archivo de nombres validos de imágenes generado"

}

#endingCharA:
#genera un archivo del total de personas que cuyo nombre finaliza con la letra "a"
endingCharA(){
	echo "Iniciando chequeo de nombres finalizados en 'a' "
	while IFS= read -r name
	do 
	  lenName=${#name}
	  lastChar=${name:lenName-1:1}
	   if [[  $lastChar == "a" ]] ; then
		   echo  $name >> dir2/endingWA
	   fi
	done < dir2/listNames
	echo "Chequeo terminado con éxito"
	echo "En caso de corresponder, el archivo fue creado"
}


#compress: none -> string
#comprime un archivo.
compress(){
        tar -zcf comprimidoFinal.tar.gz  dir/ dir2/
        echo "Se comprimió el archivo."
}


#end: none -> string string
#marca el fin del proceso del archivo comprimir.
end(){
        echo "Fin de proceso de archivo comprimir"
        echo -------------------------------------------------------
}

#main: none -> none
#agrupa todas las funciones en el orden correspondiente
main(){
	init
	getNames
	getValidNames
	endingCharA
	compress
	end
}

main
