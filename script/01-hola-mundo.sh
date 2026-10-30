#!/bin/bash

clear

if [ $# -eq 1 ]
then 
	who | grep $1 > /dev/null
	
	if [ $? -eq 0 ]
	then
		echo "  ¡¡¡hola mundo, $1 !!!"
	else
		echo "Error, el usuario no esta conectado"
		exit 2
	fi
else
	echo "Error: debes especificarme un nombre"
	exit 1
fi
