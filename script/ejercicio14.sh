#!/bin/bash
# Realizar un script que indique si los ficheros pasados por parámetro existen o no existen
clear

if [ -e $1 ] 
then
	echo "La ruta si existe"
else
	echo "La ruta no existe"
fi
