# Descripción
Actualiza Firefox sin necesidad de ser root, tiene dos scripts, uno para equipos con root y otro sin root. Válido para cualquier distro Linux.

# Instrucciones

Hay que seguir los siguientes pasos:

1- Nos bajamos el contenido de este repositorio. Para ello nos situaremos sobre Clone or download (botón verde) y acto seguido haremos clic en Download ZIP. Se nos descargarán los archivos necesarios.

2- Abrimos una terminal.

3- Una vez tengamos abierta la terminal, nos situaremos sobre el directorio Descargas. Escribiremos cd Descargas/

4- Ya estamos en la carpeta correspondiente. Ahora hay que descomprimir el archivador descargado en el paso 1. Al tratarse de un .zip escribirimos la orden apropiada, que será unzip seguido del nombre de nuestro archividador, por tanto teclearemos unzip actualiza-firefox-master.zip

5- ¡Bien! Ya tenemos el archivador descomprimido en una carpeta. Ahora nos tocará acceder a dicho directorio.

6- Para acceder a la carpeta que contiene nuestros archivos descomprimidos teclearemos de nuevo cd actualiza-firefox-master/

7- Es el momento de hacer correr al script, no sin antes darle permisos de ejecución. Esto es relativamente sencillo, con un chmod +x actualiza_firefox_no.sh lo tendremos listo.

8- ¡Ahora sí! Llegó el momento final. Para ejecutar nuestro script simplemente habrá que insertar en la terminal la siguiente orden: ./actualiza_firefox_noroot.sh 

9- Antes de hacer nada, el script nos preguntará si queremos realizar el proceso de descarga del nuevo Firefox. Responderemos con el 1 y posteriormente pulsaremos la tecla Intro.

El archivo hará todo el trabajo sin necesidad de que el usuario tenga que intervenir de alguna manera. Cuando haya acabado nos mostrará un OK rojo en pantalla.

Para diferenciar esta versión con la instalada en el sistema (la anterior versión no se borrará y por tanto ambas convivirán perfectamente) se nos creará un acceso directo tanto en el escritorio como en el menú Aplicaciones > Internet. A simple vista se diferencia de la versión incluida en el sistema por el color del logotipo de Firefox que en nuestro caso se trata de un color azul (a diferencia del naranja que viene por defecto con el Firefox de serie).
