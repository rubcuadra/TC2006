FROM ubuntu:congit

RUN apt-get upgrade
RUN apt-get update
RUN apt-get install sl -y
RUN mkdir prueba
RUN echo "hello" > prueba/greeting.txt
VOLUME volp

ENV PRUEBA="Hola"

# CMD sl  #Siempre que se arranca el container se invoca

EXPOSE 80 443