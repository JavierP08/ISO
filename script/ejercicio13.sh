#!/bin/bash
#Realizar un script para averiguar el número más grande a partir de tres números pasados por parámetro. Mostrar un error si no se proporcionan los parámetros suficientes.
clear 

if [[ -z "$1" || -z "$2" || -z "$3" ]] 
then 
	echo "No me has puesto uno o ninguno de los valores"
else 
	if [[ $3 -lt $1 && $3 -lt $1 ]] 
	then
		echo "El primero número es más grande"
	else
		if [[ $3 -lt $2 && $1 -lt $2 ]] 
		then
			echo "El segundo número es más grande"
			
		else
			echo "El tercer número es más grande"
		fi
	fi
fi
