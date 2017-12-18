## Uso

Con el fin de facilitar el uso de los script php y php-server, se provee este
script con 5 opciones:
  * Setear versión global
  * Setear versión local
  * Instalar una version (docker pull de los repositorios dados)
  * Listar versiones instaladas
  * Listar opciones disponibles para bajar de los repositorios

El uso esa especificado en el help del script

## Variables de ambiente

Para el correcto uso de este script, se debe entender que funciona seteando
variables de ambiente que usará el script php y php-server.
Este script **NO** instala ninguna versión de php provistas por el sistema, sino
que simplemente baja la imagen docker del repositorio especificado.
