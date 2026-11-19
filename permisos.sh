#!/bin/bash 

##	    ##
# VALIDACIÓN #
##  	    ##
clear
# ¿Realmente estoy recibiendo 4 parámetros? -> $#
if [ $# -ne 4 ]
then 
	echo "ERROR: No hay cuatro parametros"
	echo "----> $0 fichero add/remove permisos usuario"
	exit 1

else
	echo "Hay cuatro parametros"
fi
# ¿Realmente existe el fichero especificado?
if [ ! -f $1 ]
then
	echo "ERROR: $1 es un fichero que no existe"
	exit 2

fi
##	    	     ##
# Logica del programa #
##  	    	     ##
echo "-----PARAMETROS-----"
echo " Nombre del fichero: $1"
echo " Añado o quit: $2"
echo " Permisos: $3"
echo " Usuario/Grupo/OTRO: $4"
echo "--------------------"

if [ $2 == "add" ]
then 
	chmod "$4+$3" $1
	echo "$?"
elif [ $2 == "remove" ]
then
	chmod "$4-$3" $1
	echo "$?"
else 
	echo "ERROR: No es un valor valido"
fi 	


echo "------------RESULTADO-----------"
ls -l $1
echo "--------------------------------"
#chmod ugo+rwx archivo.txt
#chmod $4$2$3 $1

