#!/bin/bash
#Lo primero que hacemo es un menú donde le pediremos al usuario que nos marque que 
#opcion quiere hacer 
if [ $(whoami) == "root" ]
then 
	echo "----------------------------"
	echo "ERROR, eres el administrador"
	echo "----------------------------"
	exit 1
fi

if [ $# -ne 0 ]
then 
	echo "No puede haber más de un parametro"
fi

while true
do
	clear
	echo "      ========MENU=========         "
	echo "1) Contenido de un determinado directorio"
	echo "2) Buscar fichero"
	echo "3) Borrar un fichero"
	echo "4) Cambiar permisos"
	echo "5) Cambiar propietario"
	echo "6) Mostrar fecha"
	echo "0) Salir"

	read -p "Especifica la opción a ejecutar:  " opcion

	#Ahora marcamos lo que hace cada accion con case
	case $opcion in
	0)
	#Con esta condicion nos sale del escript
		echo "Te has salido"
		exit 0
		;;
	1) 
	#muestra el contenido del archivo
		echo "El directorio tiene que estar en ruta absoluta"
		read -p "Dime que directorio quieres mostrar: " directorio
		
		if [ $directorio -ne 0 ]
		then
			echo "Error: ha habido un problema"
		else 
			ls -l $directorio
		fi
		;;
	2)
		read -p "Dime el archivo que quieres buscar: " archivo
		find /* $archivo	
		;;
	3)	
		read -p "dime la ruta del archivo con el archivo que quieres borrar: " archivo
		read -p "seguro que quieres borrar $archivo [si/no]:" opcion
		if [ $opcion == "si" ]
		then 
			rm -r $archivo
		elif [ $opcion == "no" ]
		then
			echo "el archivo no se ha borrado"
		else 
			echo "No has puesto un parametro correcto es [si/no]"
		fi
		;;
	4)
		read -p "Dime a que archivo quieres cambiarle los permisos: " archivo
		read -p "Que permisos quieres [ rwx ]: " permisos
		read -p "A que grupo [ ugo ]: " grupos
		read -p "quieres quitarselos [ remove ], quieres añadirlos [ add ]: " tipo
		if [ $tipo == "add" ]
		then 
			chmod "$grupos+$permisos" $archivo
		elif [ $tipo == "remove" ]	
		then 
			chmod "$grupos-$permisos" $archivo
			
		else 
			echo "Error: Falta algún valor"
		fi 
		ls -l $archivo
		;;
	5)
		read -p "Dime a que archivo quieres cambiarle los permisos: " archivo
		read -p "A que usuario quieres cambiarle: " usuario
		
		chown $usuario $archivo
		echo "El archivo ahora pertenece al usuario: $usuario"
		ls -l 
		;;
	6)
		date
		;;
	*)
		echo "No puedes elegir esta opcion tiene que estar dentro de las opciones del menú"
		;;
	esac
#Pausa el bucle hasta que le demos a una tecla
	read -p "Pulsa una tecla para continuar..." continuar
done
