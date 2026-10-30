#!/bin/bash
# Realizar un script que sume dos números que se pasan como argumento a línea de comandos, y si no son pasados se devolverá error y se mostrará un mensaje indicando la forma de ejecutar el script.


if [ $1 -eg "" or $2 -eg "" ]
then 
	echo"No se puede hacer la operación, falta un valor"
else
	echo "valor1 $1"
	echo "valor2 $2"
	echo "La suma de los valores da $1+$2"
fi

