#!/bin/bash
#Lo primero que hacemo es un menú donde le pediremos al usuario que nos marque que 
#opcion quiere hacer 
while true
do
	clear
	echo "     =========MENU=========         "
	echo "1) Comprueba si existe un fichero   "
	echo "2) Comprueba si existe un directorio"
	echo "3) Crear"
	echo "4) Salir"
	echo "     ======================         "

	read -p "Especifica la opción a ejecutar:  " opcion

	#Ahora marcamos lo que hace cada accion con case
	case $opcion in
	1) 
		read -p "Dime el fichero a comprobar: " ruta
		if [ -f $ruta ]
		then
			echo "El fichero existe"
		elif [ -d $ruta ]
		then
			echo "ERROR: No es un fichero"
		
		else 
			echo "ERROR: No existe ese fichero"
		fi
		;;
	2)
		read -p "Dime la ruta del directorio: " ruta_d
		
		if [ -d $ruta_d ]
		then
			echo "ENORABUENA: La ruta existe"
			
		elif [ -f $ruta_d ]
		then
			echo "ERROR: No es un directorio"
		else
			echo "ERROR: NO existe el Directorio "
		fi
		;;
	3)	
		echo "=======MENU=========="
		echo "1. Fichero"
		echo "2. Directorio"
		echo "====================="
		
		read -p "Dime que quieres crear: " opcion_1
		case $opcion_1 in 
		1)
			echo "La ruta tiene que estar en absoluto sin terminar en /"
			read -p "Dime donde quieres crear el fichero: " ruta_F
			read -p "Dime como se llamara el fichero: " fichero
			
			touch $ruta_F/$fichero
			ls -la $ruta_F
			
			;;
		2)	echo "La ruta tiene que estar en absoluto sin terminar en /"
			read -p "Dime donde quieres crear el directorio: " ruta_D
			read -p "Dime como se llamara el directorio: " directorio
			
			mkdir -p ruta_D/directorio
			echo "La carpeta se ha creado"
			ls -la $ruta_D/$directorio
			;;
		*)
		echo "No puedes elegir esta opcion tiene que estar dentro de las opciones del menú"
		;;
		esac
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
