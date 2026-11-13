#!/bin/bash
#Lo primero que hacemo es un menú donde le pediremos al usuario que nos marque que 
#opcion quiere hacer 
while true
do
	clear
	echo "      ========MENU=========         "
	echo "1) Comprueba si existe un fichero   "
	echo "2) Comprueba si existe un directorio"
	echo "3) Crear"
	echo "4) Salir"

	read -p "Especifica la opción a ejecutar:  " opcion

	#Ahora marcamos lo que hace cada accion con case
	case $opcion in
	1) 
		echo "Comprobando si existe un fichero ..."
		;;
	2)
		echo "Comprobando si existe un Directorio ..."
		;;
	3)	
		echo "Creando la ruta ..."
		;;
	4)
		echo "Te has salido"
		exit 0
		;;
	*)
		echo "No puedes elegir esta opcion tiene que estar dentro de las opciones del menú"
		;;
	esac
#Pausa el bucle hasta que le demos a una tecla
	read -p "Pulsa una tecla para continuar..." continuar
done
