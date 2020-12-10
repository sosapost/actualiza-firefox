#!/bin/bash

##Script para actualizar Firefox en sistemas con privilegios root.

#VARIABLES

CHEC64=x86_64
HOME=~/
CARPETASISTEMA=/usr/lib
DESCARGA32=https://download-installer.cdn.mozilla.net/pub/firefox/releases/83.0/linux-i686/es-ES/firefox-83.0.tar.bz2
DESCARGA64=https://download-installer.cdn.mozilla.net/pub/firefox/releases/83.0/linux-x86_64/es-ES/firefox-83.0.tar.bz2
DIRECTORIO=firefox*.tar.bz2
LANZADOR=https://raw.githubusercontent.com/aosucas499/actualiza-firefox/master/firefox-latest.desktop
NEWLANZADOR=firefox-latest.desktop
ROJO="\033[1;31m"
NORMAL="\033[0m"
AZUL="\033[1;34m"

#Ingresamos al home del usuario.

cd $HOME

#Bajamos la última versión disponible desde la web de Firefox.

echo -e "${ROJO}¡¡¡ATENCIÓN!!! Se va a descargar la última versión de Firefox disponible hasta la fecha [09-12-2020]. ¿Desea continuar?${NORMAL}"

select yn in "Sí" "No" ; do
    case $yn in 
        "Sí" ) break;;
        "No" ) exit 0 ;; 
    esac

done

function CompruebaArch()
{

CHECK=$(uname -m |grep $CHEC64)
  if [ "$?" == "0" ] ; then
   echo -e "${AZUL}Este sistema es de 64 bits${NORMAL}"
   echo -e "${AZUL}Descargando Firefox para arquitecturas de 64 bits${NORMAL}"
   wget  $DESCARGA64 -q --show-progress
   else
   echo -e "${AZUL}Este sistema es de 32 bits"${NORMAL}   
   echo -e "${AZUL}Descargando Firefox para arquitecturas de 32 bits${NORMAL}"
   wget  $DESCARGA32 -q --show-progress
 
  fi  
}

CompruebaArch

#echo -e "${AZUL}Descargando Firefox...${NORMAL}"
#wget $DESCARGA -q --show-progress

#Paso para descomprimir Firefox

function EnBuscaDePV()
{

BUSCAPV=$(which pv)

if [ "$?" == "0" ] ; then
   echo "PV se encuentra instalado" > /dev/null
   else
   echo -e ${AZUL}"PV no está instalado. Se procederá a su descarga"${NORMAL}
   sudo apt install pv
 
fi

}

EnBuscaDePV

echo -e "${AZUL}Firefox se está descomprimiendo en un directorio del sistema...${NORMAL}"

sudo pv $DIRECTORIO | tar -xjf - -C $CARPETASISTEMA

sudo mv $CARPETASISTEMA/firefox $CARPETASISTEMA/firefox-latest

#Descargamos el lanzador del nuevo Firefox.

wget $LANZADOR -q

echo -e "${AZUL}Creando rutas y lanzadores...${NORMAL}"

#Nos aseguramos que 'applications' existe

sudo mkdir /usr/share/applications 2> /dev/null

sudo cp $NEWLANZADOR /usr/share/applications/

cp $NEWLANZADOR ~/Escritorio

#Borramos archivos residuales

echo -e "${AZUL}Borrando archivos residuales...${NORMAL}"

rm $NEWLANZADOR

rm $DIRECTORIO

#Borra el actualizador automático ya que puede que en un futuro las actualizaciones no sean compatibles con el sistema.

rm $CARPETASISTEMA/firefox-latest/updat* 2> /dev/null

echo -e "${ROJO}OK${NORMAL}"

#Librería necesaria en sistemas antiguos y poder usar nuevas versiones de firefox.
sudo apt-get install libatomic1 -y 

#Añadimos notificación

echo 'Firefox se ha actualizado correctamente' 'Puede acceder a la nueva instalación desde Aplicaciones > Internet o desde el acceso directo creado en el escritorio del sistema'

 

exit 0

