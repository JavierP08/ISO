#!/bin/bash
# Realizar un script que sume dos números que se pasan como argumento a línea de comandos, y si no son pasados se devolverá error y se mostrará un mensaje indicando la forma de ejecutar el script.


if [[ -z "$1" || -z "$2" ]]
then 
	echo "No se puede hacer la operación, falta un valor"
	echo "Tienes que poner en nombre del scrip junto a dos valores"
else
	echo "valor1 $1"
	echo "valor2 $2"
#Creo una variable para hacer la suma y luego la muestro con un echo el resultado
	suma=$(($1 + $2))
	echo "La suma de los valores da $suma"
fi

