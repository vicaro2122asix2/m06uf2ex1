#!/bin/bash
#Víctor Caballero Roca

clear
echo "Quin usuari vols esborrar? "
read nomusuari

	echo -n "Segur que el vols eliminar? (y/n)"
	read opcio
	if  [[  $opcio  ==  "y" ]]
	then
	userdel -r $nomusuari
	else
	echo "Sortint del programa"
	fi

exit 0
