#!/bin/bash
clear
usuario="Javier"
apellido="Plaza"

echo $usuario $apellido
echo "Hola mundo"

read -p "Especifica el directorio a consultar :" directorio

echo "El contenido del directorio es "
ls -l $directorio

echo "El directorio tiene un numero de lineas"
ls -l $directoio | wc -l

mkdir $directorio/diego
ls -l $directorio
