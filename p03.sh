#!/bin/bash
#Víctor Caballero Roca


clear
function servi {
	echo -n "Quin servei vols aturar? : "
	read servei
	return 0
}

function ser {
	systemctl stop $servei 
	systemctl status $servei | grep Active:

}

function check {
comptador = "c" ;
while [ comptador == 'c' ]
do
	servi
	echo -n "Vols Continuar?: "
	read comptador
	done
	return 10
}

if [ $EUID -ne 0 ]
	then
	echo "Aquest script s'ha d'executar amb l'ordre sudo"
	exit 1
fi
servi
ser
check

