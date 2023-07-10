#!/bin/bash


#getNames: none -> file string
#se encarga de hacer la lista de los nombres que toman las imagenes en un archivo listNames
getNames(){
	ls dir > listNames
	echo "Archivo de todos los nombres de imágenes generado."
}

#getValidNames: none -> file string
#se encargade hacer la lista de los nombres validos que toman las imagenes en un archivo listValidNames
getValidNames(){
	ls dir2 > listValidNames
	echo "Archivo de nombres validos de imágenes generado"

}

#endingCharA:
#genera un archivo del total de personas que cuyo nombre finaliza con la letra "a"
endingCharA(){
	while IFS= read -r line
	do
	  echo "$line"
	  nombre=$($line|cut -d " " -f-1)
	  echo $nombre
	  length=$(echo {$name})
	  echo "$lenght"
	  # if [[name == a ]] 
	done < listNames
	#lines=$(wc -l listNames)
	#for ((i=1, i<=$lines, i++ )); do
	#	lastchar=$(cut -d " " -f-1)
	#	if [[ ]]

}


endingCharA



