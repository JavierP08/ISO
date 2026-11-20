#!/bin/bash 

##	    ##
# VALIDACIÓN #
##  	    ##
clear
# ¿Realmente estoy recibiendo 4 parámetros? -> $#
if [ $# -ne 0 ]
then 
	echo "ERROR: El script no puede recibir parámetros"
	echo "----> ./$0 "
	exit 1

fi
# ¿Realmente existe el fichero especificado?



##	    	     ##
# Logica del programa #
##  	    	     ##

#chmod ugo+rwx archivo.txt
#chmod $4$2$3 $1
while true
do
	clear
	echo "--------_MENU_--------"
	echo "1 ] Crear archivo con permisos"
	echo "2 ] Opcion 2"
	echo "3 ] Opcion 3"
	echo "4 ] Opcion 4"
	echo "5 ] Salir"
	echo "-----------------------"
	read -p "Infica la operacion a realizar: " opcion
	
	echo "Has seleccionado la opcion $opcion" 
	
	case $opcion in 
	1)
		while true
		do
			read -p "Dime el nombre del archivo que quieres crear: " archivo
		
			if [ ! -f $archivo ]
			then
				break	 	
			else
				echo "El archivo existe"
			 	
			fi
		done	
#Creación de fichero con permisos
			touch $archivo
			read -p "Que permisos quieres ponerle: " permisos
			chmod "$permisos" $archivo
			echo ""
			echo "------ PERMISOS_ARCHIVO -------"
			ls -l $archivo
		
	;;
	
	2)
		echo "opcion_2"
	;;
	3)	
		echo "opcion_3"
	;;
	4) 
		echo "opcion_4"
	;;
	5)
		echo "Has seleccionado salir"
		echo "Adios"
		break
	;;
	*)
		echo "Esa opcion no es del menú ponme otro número"
	;;
esac
	
	read -p "pulsa una tecla para continuar: " pausa
done 


