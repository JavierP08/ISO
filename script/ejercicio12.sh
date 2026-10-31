#!/bin/bash
# Realizar un script que reciba dos números por parámetro y muestre un mensaje indicando si ambos números son iguales, si el primer número es mayor o si el segundo número es mayor.
clear

if [[ -z "$1" || -z "$2" ]]
then
	echo  "no me has puesto níngun número"
else
	if [ $1 -gt $2 ]
	then
		echo "El primer número es mayor que el segundo"
	else 
		if [ $1 == $2 ] 
		then
			echo "Los dos números son iguales"
		else
			echo "El primer número es menor que el segundo"
		fi
	fi
fi
