#!/bin/bash
clear
# Miramos si en esa ruta existe el archivo
ls /home/$USER/config/ip.md > /dev/null 2>&1

if [ $# -ne 1 ]
then 
	echo "debes de especificar una IP"
	exit 1
else
	if [ $? -ne 0 ]
	then
# Creamos el directorio config y posteriormente el de ip.md saliendonos un mensaje de que
# ya se ha creado el archivo
		echo "el archivo no existe procedemos a crearlo"
		mkdir /home/$USER/config
# el $1 equivale a 
		echo "IP:Server=$1" > /home/$USER/config/ip.md

		echo "creado...... y con el contenido"
		cat /home/$USER/config/ip.md
	else
# Mostramos un mensaje de que el archivo ya existe
		echo "el archivo de configuración existe"
	fi	
fi


