#!/bin/bash

##Borra el Firefox descargado a través de actualiza_firefox

#VARIABLES

#HOME=~/
DESKTOP=~/Escritorio
CARPETALOCAL=~/firefox/
CARPETASISTEMA=/usr/lib/firefox-latest/
LOCAL=~/.local/share/applications
SISTEMA=/usr/share/applications
NEWLANZADOR=firefox-noroot.desktop
NEWLANZADOR2=firefox-latest.desktop
ROJO="\033[1;31m"
NORMAL="\033[0m"
AZUL="\033[1;34m"

echo -e "${ROJO}¿Quiere eliminar la versión de Firefox ? Esto no borrará la versión de Firefox instalada en el sistema base.${NORMAL}"

select yn in "Sí" "No" ; do
    case $yn in 
        "Sí" ) break;;
        "No" ) exit 0 ;; 
    esac

done

echo -e "${AZUL}Borrando Firefox...${NORMAL}"

#FIREFOX NO ROOT
rm -r $CARPETALOCAL 2> /dev/null

rm $DESKTOP/$NEWLANZADOR 2> /dev/null

rm $LOCAL/$NEWLANZADOR 2> /dev/null


#FIREFOX ROOT
sudo rm -r $CARPETASISTEMA 2> /dev/null

sudo rm $DESKTOP/$NEWLANZADOR2 2> /dev/null

sudo rm $SISTEMA/$NEWLANZADOR2 2> /dev/null

echo -e "${ROJO}OK${NORMAL}"

exit 0


