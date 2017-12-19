## Instalación

1. Clonar el repositorio en ~/.phpenv
```bash
$ git clone git@github.com:lucasdc6/phpenv.git
```

2. Agregar el directorio ~/.phpenv/bin para contar con todos los ejecutables
```bash
echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> ~/.bash_profile
```
En ubuntu Ubuntu modificar ~/.bashrc

En Zsh modificar ~/.zshrc

3. Reiniciar la terminar para que los cambios surgan efecto.

Junto con el script de phpenv se van a contar con 2 script extra:
 * php, el cual funciona a modo de wrapper de las imagenes docker
  descargadas por phpenv. El funcionamiento es mediante variables
  de ambiente (Ver Variables de ambiente).
 * php-server

## Uso

Con el fin de facilitar el uso de los script php y php-server, se provee este
script con 5 opciones relacionadas al manejo de versiones:
  * Setear versión global
  * Setear versión local
  * Instalar una version (docker pull de los repositorios dados)
  * Listar versiones instaladas
  * Listar opciones disponibles para bajar de los repositorios
Además se cuenta con 3 opciones para el manejo de los repositorios docker:
  * Listar repositorios
  * Agregar repositorio
  * Eliminar repositorio
  
Para el manejo de los repositorios, se cuenta con un archivo de configuración
disponible en la el directorio etc, llamado _repositories._

En este archivo se cuenta con una lista de repositorios separados por saltos
de líneas.

Se recomieda no editar este archivo a mano.

Es muy importante además **NO** eliminar dicho archivo de configuración.

## Variables de ambiente

Para el correcto uso de este script, se debe entender que funciona seteando
variables de ambiente que usará el script php y php-server.
Este script **NO** instala ninguna versión de php provistas por el sistema, sino
que simplemente baja la imagen docker del repositorio especificado.
