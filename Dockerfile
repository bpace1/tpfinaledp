FROM alpine
MAINTAINER Bruno Pace, Matias y Alexis Cattaneo - Estudiantes TUIA Comision 1
RUN apk update
RUN apk upgrade
RUN apk --no-cache add curl
RUN apk --update add imagemagick
EXPOSE 80
RUN mkdir -p tuia/salida
ADD ["generar.sh","/tuia/"]
ADD ["descomprimir.sh","/tuia/"]
ADD ["procesar.sh","/tuia/"]
ADD ["comprimir.sh","/tuia/"]
ADD ["menu.sh","/tuia/"]
RUN chmod 777 /tuia/generar.sh
RUN chmod 777 /tuia/descomprimir.sh
RUN chmod 777 /tuia/procesar.sh
RUN chmod 777 /tuia/comprimir.sh
RUN chmod 777 /tuia/menu.sh
ENTRYPOINT ["/tuia/menu.sh"]
