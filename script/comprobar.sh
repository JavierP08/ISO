#!/bin/bash
#Lo primero que hacemo es un menú donde le pediremos al usuario que nos marque que 
#opcion quiere hacer 
echo "      ========MENU=========         "
echo "1) Comprueba si existe un fichero   "
echo "2) Comprueba si existe un directorio"
echo "3) Crear"
echo "4) Salir"

read -p "Especifica la opción a ejecutar:  " opcion
#Marcamos las condiciones que puede hacer 
if [ $opcion -eq 1 ]
then 
	echo "Comprobado el fichero"
elif [ $opcion -eq 2 ]
then
	echo "Comprobado el directorio"
elif [ $opcion -eq 3 ]
then
	echo "El fichero esta creado"
elif [ $opcion -eq 4 ]
then
	echo "Has seleccionado salir"
	exit 0
else
	echo "El valor que has puesto está fuera del menú "
fi
