#!/bin/bash 

clear

# Mira que haya dos parametros siendo el primero la ruta y luego el fichero 
#Creamos dos variabeles 
directorio=$1
fichero=$2

# validacion administrador no pueda entrar
if [ $(whoami) == "root" ]
then 
	echo "----------------------------"
	echo "ERROR, eres el administrador"
	echo "----------------------------"
	exit 1
fi
# Validacion de Parametros
if [ $# -ne 2 ]
then 
	echo "---------------------------------------------"
	echo "ERROR, el número de parámetros es incorrecto"
	echo "-----------------AYUDA-----------------------"
	echo "      ./comprobar.sh directorio fichero      "
	echo "---------------------------------------------"
	exit 2
fi
  		
#Verificamos que el primero parametro es una ruta absoluta
if [[ "$1" != /* ]]
then
	echo "------------------------------------------------"
	echo " ERROR El directorio debe ser una ruta absoluta "
	echo "------------------------------------------------"
	exit 3
fi

if [ ! -d $1 ] 
then 
	echo "El directorio $1, --->  NO EXISTE"
	exit 4
fi

if [ ! -f $2 ] 
then 
	echo "El fichero $2, --->  NO EXISTE"
	exit 5
fi

# Logica del programa
# cp archivo directorio
cp $2 $1 &> /dev/null

echo "El contenido del directorio destino es :"
echo "________________________________________"
ls $1 2> /dev/null

exit 0	
