#!/bin/bash
#Víctor Caballero Roca


clear
if ! [ $(id -u) = 0 ];
then
	echo "Aquest script s'ha d'executar amb l'ordre sudo"
	exit 1
	else
	wget http://www.collados.org/asix2/m06/uf2/alumnes.ods
	if (( $? != 0 ))
		then
		echo "No s'ha descarregat res"
		exit 2
		else
		libreoffice --headless --convert-to csv alumnes.ods
		if (( $? != 0 ))
			then
			echo "La conversió ha fallat"
			exit 3
			else
			rm alumnes.ods
			cat alumnes.csv | cut -d "," -f 2 > alumnes2.csv
			rm alumnes.csv
			mv alumnes2.csv alumnes.csv
			while read line
			do
			PASSWORD=$(echo $RANDOM$(date +%N%s) | md5sum | cut -c 2-11)
			echo "$line:$PASSWORD" >> contrasenyes_alumnes.txt
			echo "__________" >> contrasenyes_alumnes.txt

			done < alumnes.csv
			if (( $? != 0 ))
				then
				echo "Hi ha problemes per crear usuaris"
				exit 4
				else
				exit 0
				fi
			fi
		fi
	fi
