#!/bin/bash
#Realizar un script que solicite al uscat uario por teclado su peso y su estatura. A continuación debe mostrar la siguiente salida por pantalla (respetando los saltos de línea y las tabulaciones)

#Pido que me escriba el peso
read -p "Dime cual es tu peso: " peso
read -p "Dime cual es tu altura: " altura 
#Muestro la altura y el peso que me ha pedido
echo -e "Tus datos son"
echo -e "\tPeso: $peso kg"
echo -e "\tAltura: $altura cm"
