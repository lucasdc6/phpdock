## Instalación

1. Clonar el repositorio en ~/.phpdock
```bash
$ git clone git@github.com:lucasdc6/phpdock.git
```

2. Agregar el directorio ~/.phpdock/bin para contar con todos los ejecutables
```bash
$ echo 'export PATH="$HOME/.phpdock/bin:$PATH"' >> ~/.bash_profile
```

3. Agregar el archivo php_global y la variable PHPDOCKPATH al bashrc
```bash
$ echo 'source ~/.phpdock/etc/php_global' >> ~/.bash_profile
$ echo 'export PHPDOCKPATH="$HOME/.phpdock"' >> ~/.bash_profile
```
En ubuntu Ubuntu modificar ~/.bashrc

En Zsh modificar ~/.zshrc

4. Reiniciar la terminar para que los cambios surgan efecto.


## Uso

Con el fin de facilitar el uso de los script php y php-server, se provee este
script con 5 opciones relacionadas al manejo de versiones:
  * Setear versión global (requiere reinicio de terminal)
  * Setear versión local (no requiere reinicio de terminal)
  * Instalar una version (docker pull de los repositorios dados)
  * Listar versiones instaladas
  * Listar opciones disponibles para bajar de los repositorios
Además se cuenta con 3 opciones para el manejo de los repositorios docker:
  * Listar repositorios
  * Agregar repositorio
  * Eliminar repositorio

Para el manejo de los repositorios, se cuenta con un archivo de configuración
disponible en el directorio etc, llamado _repositories._

En este archivo se cuenta con una lista de repositorios separados por saltos
de líneas.

Se recomieda no editar este archivo a mano.

Es muy importante además **NO** eliminar dicho archivo de configuración.

## Agregar repositorios propios

Para agregar un repositorio propio, simplemente se deben seguir una simple regla
para que el script pueda reconocer las imágenes.

La regla a seguir, es taguear las imágenes con un nombre que contenga "cli" o
"apache", dependiendo del tipo de imagen que sea.

Las imágenes tagueadas con un "cli" en su nombre serén utilizadas por el script
php, mientras que las "apache", serán utilizadas por el script php-server

De seguir esta regla, solo hace falta agregar el repositorio de la siguiente
manera:

```bash
  $ phpdock --add <NOMBRE DEL REPOSITORIO>
```

Por ejemplo, para agregar el repositorio oficial de php, solo hace falta
ejecutar:

```bash
  $ phpdock --add php
```

Como se puede notar, las imágenes en este repositorio son tagueadas siguiendo la
regla anteriormente nombrada.

## Variables de ambiente

Para el correcto uso de este script, se debe entender que funciona seteando
variables de ambiente que usará el script php y php-server.
Este script **NO** instala ninguna versión de php provistas por el sistema, sino
que simplemente baja la imagen docker del repositorio especificado.
