#!/bin/bash
# Realizar un script que muestre el nombre del script, el número de parámetros que se le
# pasan, una lista con los parámetros recibidos, el identificador del usuario que ejecuta el
# script, el nombre de usuario, el directorio home del usuario y el directorio actual.
clear
#Mostramso el nombre del fichero con $0
echo "Nombre: $0"
echo -e ""
#Mostramos los parametros que le hemos pasado con $#
echo "Número Parametros: $# "
echo -e ""
#Mostramos la lista de paramatros con $@
echo "Parametros son: $*"
echo -e ""
#Identificar el usuario 
echo "Identificador" $(id -u)
echo -e ""
#Nombre usuario
echo "usuario" $(whoami)
echo -e ""
#Mostramos el directorio home
echo "Directoio Home: $HOME"
echo -e ""
#Mostramos el directio actual
echo "directorio actual $PWD"
