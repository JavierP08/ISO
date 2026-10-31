#!/bin/bash
#Realizar un script que reciba un número por parámetro y, si es mayor que 100, muestre el mensaje "Número es mayor que 100". En caso contrario que muestre el mensaje “Número NO es mayor que 100”
 
 if [ $1 -ge "100" ]
 then 
 	echo "El número es mayor de 100"
 else
 	if [ -z $1 ]
 	then 
 		echo "No hay ningún valor"
 	else
 		echo "El número es menor de 100"
 	fi
 fi
