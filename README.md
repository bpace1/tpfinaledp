Trabajo Práctico FINAL Entorno de programación - 2023
Autores: 
	- Cattaneo Matias.
	- Cattaneo Alexis.
	- Pace Bruno.

El programa se ocupa de Descargar imágenes de personas,
de manera tal, que todas las que inician con nombres
en mayúscula, sean procesadas a un cuadrado.
También, se ocupa de comprimir los archivos necesarios para cumplir las consignas.

Para utiizar nuestro programa es necesario tener instalado
docker y  utilizar los siguientes comandos:

$ git clone https://github.com/bpace1/tpfinaledp.git

$ sudo docker build --tag tuia/debian1.0 .

$ sudo docker run -it -v `pwd`/..:/tuia/salida tuia/debian1.0

