FROM ubuntu
MAINTAINER Bruno Pace, Matias y Alexis Cattaneo - Estudiantes TUIA Comision 1
RUN apt-get update 
RUN apt-get install -y curl 
RUN apt-get install -y imagemagick
RUN apt-get clean
EXPOSE 80
ENTRYPOINT ["/bin/bash"]
