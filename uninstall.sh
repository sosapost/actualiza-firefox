#!/bin/bash

##Borra el Firefox descargado a través de actualiza_firefox_glinexall

#VARIABLES

#HOME=~/
DESKTOP=~/Escritorio
CARPETA=~/firefox/
LOCAL=~/.local/share/applications
NEWLANZADOR=firefox-noroot.desktop
ROJO="\033[1;31m"
NORMAL="\033[0m"
AZUL="\033[1;34m"

echo -e "${ROJO}¿Quiere eliminar la versión de Firefox alojada en su directorio personal? Esto no borrará la versión de Firefox instalada en el sistema base.${NORMAL}"

select yn in "Sí" "No" ; do
    case $yn in 
        "Sí" ) break;;
        "No" ) exit 0 ;; 
    esac

done

echo -e "${AZUL}Borrando Firefox...${NORMAL}"

rm -r $CARPETA 2> /dev/null

echo -e "${AZUL}Eliminando rutas y lanzadores...${NORMAL}"

rm $DESKTOP/$NEWLANZADOR 2> /dev/null

rm $LOCAL/$NEWLANZADOR 2> /dev/null

echo -e "${ROJO}OK${NORMAL}"

exit 0


