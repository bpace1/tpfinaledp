#!/bin/bash
#init: none -> string
#imprime un mensaje de bienvenida al programa.
init(){
	echo "BIENVENIDO AL TP FINAL DE EDP 2023"
}

#titles: none -> string string string string string
#imprime por pantalla las opciones que se le dan al usuario
titles(){
	echo "Ingrese un comando de la siguiente lista y luego pulse enter:"
        echo "1 para Generar imágenes." 
        echo "2 para Procesar imágenes."
	echo "3 para Descomprimir imágenes."
        echo "4 para Comprimir imágenes."
	echo "Si presiona cualquier otra tecla seguida de un enter, saldrá del programa."

}

#end: none -> string
#muestra mensajes del fin del programa
end(){
	echo "Saliendo del programa."
	echo "Usted ha salido del programa. Vuela pronto."

}

#options: number -> string 
#lee la consola para chequear que archivo ejecutar, dando un mensaje a 
options(){
	y=true
	while [ y ]
	do
		titles	
		read CMD
		if [[ $CMD  =~ ^[1-4]$ ]] ; then
        	        case $CMD in
                	        3)
                                     	bash descomprimir.sh
	                        ;;
        	                1)
                        	        bash generar.sh
	                        ;;
        	                2)
                        	        bash procesar.sh
	                        ;;
        	                4)
                        	        bash comprimir.sh	
				;;
        	        esac
	        else
			end
			break
	        fi
	done
}



#menu: none -> none
#llama a las funciones en el orden necesario para cumplir con nuestro fin.
menu (){
	init
	options
}

menu
