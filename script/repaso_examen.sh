

while true
do
########
# MENU #
########
	clear
	echo "=========MENU========"
	echo "[ 1 ] Crear Directorio"
	echo "[ 2 ] Crear Archivo"
	echo "[ 3 ] Editar Permisos Archivos"
	echo "[ 4 ] Editar Permisos Directorio"
	echo "[ 5 ] EXIT"
	echo "====================="
	
###############
# Condiciones #
###############
	
	read -p "Dime la opcion: " opcion 

	case $opcion in 
		1)
		###########################
		# Comprobación Directorio #
		###########################
			read -p "Dime el nombre del directorio: " directorio
			if [ -d $directorio ]
			then 
				echo "================================================="
				echo " El directorio ya existe y tiene este contenido: "
				echo "================================================="
				ls -l $directorio
				
			elif [ ! -d $directorio ]
			then 
				echo "=========================="
				echo " El directorio no existe: "
				echo "=========================="
				echo ""
				echo "Terminame la ruta en /"
				read -p "Ponme la ruta absoluta de donde quieres crearlo: " ruta
				
				mkdir $ruta$directorio
				echo "=========================================================="
				ls -l $ruta
			else 
				echo "ERROR: No es un directorio"
				echo 
			fi
		;; 
		2)
		########################
		# Comprobación Fichero #
		########################
			read -p "Dime el nombre del archivo: " archivo
			if [ -f $archivo ]
			then 
				echo "========================"
				echo " El archivo ya existe : "
				echo "========================"
				ls -l $archivo
				
			elif [ ! -f $archivo ]
			then 
				echo "=========================="
				echo " El archivo no existe: "
				echo "=========================="
				echo ""
				echo "Terminame la ruta en /"
				read -p "Ponme la ruta absoluta de donde quieres crear el archivo: " ruta
				
				touch $ruta$archivo
				echo "=========================================================="
				ls -l $ruta
			else 
				echo "ERROR: No es un directorio"
				echo 
			fi
		;;
		3)
		#################################
		# Comprobación permisos Fichero #
		#################################
			read -p "Dime el nombre del archivo: " archivo
			
			echo "===========PERMISOS=========="
			read -p "Dime los permisos que quieres añadir [ rwx ] : " permisos
			read -p "Pon 'add' si añadimos y 'remove' para quitarlos: " tipo
			read -p "A que grupo quieres ponerlo [ ugo ]" grupo
			echo "============================="
		
			if [ ! -f $archivo ]
			then
				echo "====================="
				echo "El archivo NO existe"
				echo "====================="
				read -p "¿Quieres crearlo? [ Si/No ]" creacion
				if [ $creacion == Si ]
				then 
					touch $archivo 
					
				elif [ $creacion == No ]
				then 
					echo "Si no hay archivo no puedo ponerle permisos"
					
				else
					echo "ERROR: tienes que poner 'Si' o 'No'"
				fi 
			elif [ -f $archivo ]
			then 
				echo "====================="
				
				if [ $tipo == "add" ]
				then 
					chmod "$grupo+$permisos" $archivo
					echo "Se han añadido corectamente los permisos"
					ls -l $archivo
				else
					chmod "$grupo-$permisos" $archivo
					echo "Se han quitado corectamente los permisos"
					ls -l $archivo
				fi
			else
				echo "ERROR: No es un archivo sino un directorio"
			fi
		;;
		4)
		####################################
		# Comprobación permisos Directorio #
		####################################
			read -p "Dime el nombre del directorio: " directorio
			
			echo "===========PERMISOS=========="
			read -p "Dime los permisos que quieres añadir [ rwx ] : " permisos
			read -p "Pon 'add' si añadimos y 'remove' para quitarlos: " tipo
			read -p "A que grupo quieres ponerlo [ ugo ]" grupo
			echo "============================="
			
			if [ ! -d $directorio ]
			then
				echo "====================="
				echo "El Directorio NO existe"
				echo "====================="
				read -p "¿Quieres crearlo? [ Si/No ]: " creacion
				if [ $creacion == Si ]
				then 
					mkdir $directorio
					echo "====================="
				
					if [ $tipo == "add" ]
					then 
						chmod "$grupo+$permisos" $directorio
						echo "Se han añadido corectamente los permisos"
						ls -l $directorio
					else
						chmod "$grupo-$permisos" $directorio
						echo "Se han quitado corectamente los permisos"
						ls -l $archivo
					fi	
					
				elif [ $creacion == No ]
				then 
					echo "Si no hay directorio no puedo ponerle permisos"
					
				else
					echo "ERROR: tienes que poner 'Si' o 'No'"
				fi 
			elif [ -d $directorio ]
			then 
				echo "====================="
				
				if [ $tipo == "add" ]
				then 
					chmod "$grupo+$permisos" $directorio
					echo "Se han añadido corectamente los permisos"
					ls -l $directorio
				else
					chmod "$grupo-$permisos" $directorio
					echo "Se han quitado corectamente los permisos"
					ls -l $archivo
				fi
			
			fi
		;;
		5)
			echo "Ya has terminado de ejecutartar el script"
			exit 1 
			break
		;;
		*)
			echo "ERROR: Tiene que estar entre las opciones [ 1-5 ] "
		;;
	esac
	read -p "Pulsa una tecla " pausa
done
