#!/bin/bash
#Lo primero que hacemos es un menú donde le pediremos al usuario que nos marque que 
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
	exit 2
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

	#Ahora marcamos lo que hace cada opción con case
	case $opcion in
	0)
	#Con esta condicion nos sale del script
		echo "Te has salido"
		exit 0
		;;
	1) 
	#muestra el contenido del archivo
		echo "El directorio tiene que estar en ruta absoluta"
		read -p "Dime que directorio quieres mostrar: " directorio
		
		if [ ! -d $directorio ]
		then
			echo "Error: No existe el directorio"
		else 
			ls -l $directorio
		fi
		;;
	2)
	#Busca el archivo desde / y borra todos las opciones que no sean las del archivo 
		read -p "Dime el archivo que quieres buscar: " archivo
		find / -iname $archivo	2>/dev/null
		;;
	3)	
	#Se asegura de que es ese archivo el que quieres borrar y te pregunta si quieres borrarlo antes de hacerlo.
		read -p "dime la ruta del archivo con el archivo que quieres borrar: " archivo
		read -p "seguro que quieres borrar $archivo [si/no]:" opcion
		if [ $opcion == "si" ]
		then 
			rm -r $archivo
		elif [ $opcion == "no" ]
		then
			echo "el archivo no se ha borrado"
		else 
			echo "No has puesto un parametro correcto [si/no]"
		fi
		;;
	4)
	#Pregunta por los archivos, pemisos, grupos y tipo para cambiarle de permisos
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
		if [ ! -f $archivo ]
		then 
			echo "El archivo no existe"
		else 
			if chown $usuario $archivo 2>/dev/null
			then 
			ls -l $archivo
			else 
			
				echo "Error: No se ha cambiado el usuario propietario"
				echo "No tienes permisos suficientes"
			fi
		fi
		
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

		
