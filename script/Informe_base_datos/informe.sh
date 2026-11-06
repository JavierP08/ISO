#!/bin/bash 
clear
#validar
archivo=$1

if [ $# -ne 1 ]
then 
	echo "No has indicado ningún archivo, ¿Deseas utilizar base-datos.csv? [S/n]"
	read confirmacion
	
	if [ $confirmacion == "n" ]
	then
		echo "Adios, no tengo archivo para poder trabajar"
		exit 1
	fi
	archivo="base-datos.csv"
fi 

# Logica programa

echo "El archivo a utilizar es:" $archivo
# Bucle con while
i=0
while [ $i -lt 5 ]
do
	clear
	
	read -p "Dime el nombre del usuario a buscar: " nombre

	echo "___________________________________________________"
	echo "-------------> El resultado de buscar $nombre es: "
	echo "___________________________________________________"
	
	echo "___________________________________________________"
	cat $archivo | grep -i $nombre
	echo "___________________________________________________"
	read -p "Dime las columnas que quieres mostar [1-7] " columna

	echo "___________________________________________________"
	echo "-------------> El resultado de buscar $nombre es, con las columnas: $columna: "
	echo "___________________________________________________"
	
	echo "___________________________________________________"
	cat $archivo | grep -i $nombre | cut -d ";" -f$columna
	echo "___________________________________________________"
	read -p "Porque campo lo quieres ordenar " campo

	echo "___________________________________________________"
	echo "-------------> El resultado de buscar $nombre es, con las columnas: $columna, ordenado por $campo : "
	echo "___________________________________________________"
	
	echo "___________________________________________________"
	cat $archivo | grep -i $nombre | cut -d ";" -f$columna | sort -t";" -k$campo
	echo "___________________________________________________"
	
	((i++))
	read -p "Pulsa enter para continuar..." pausa
done


