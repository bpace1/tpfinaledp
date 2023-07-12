FROM debian
MAINTAINER Bruno Pace, Matias y Alexis Cattaneo - Estudiantes TUIA Comision 1
RUN apt-get update 
RUN apt-get install -y curl 
RUN apt-get install -y imagemagick
RUN apt-get -y install sudo
RUN apt-get clean
EXPOSE 80
RUN mkdir -p tuia/salida
ADD ["descomprimir.sh","/tuia/"]
ADD ["generar.sh","/tuia/"]
ADD ["procesar.sh","/tuia/"]
ADD ["comprimir.sh","/tuia/"]
ADD ["menu.sh","/tuia/"] 
ENTRYPOINT ["/bin/bash"]
