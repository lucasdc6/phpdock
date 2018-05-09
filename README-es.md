# phpdock

phpdock es un manejador de versiones de php, que utiliza como principal
tecnología [Docker](https://github.com/docker), haciendo uso del 
[repositorio oficial](https://hub.docker.com/\_/php/) de php en Docker Hub.

phpdock fue inspirado y sigue el modelo de [rbenv](https://github.com/rbenv/rbenv),
[goenv](https://github.com/syndbg/goenv) y [pyenv](https://github.com/pyenv/pyenv)

## Contenidos

* [Instalación](#instalación)
  * [Local](#local)
* [Uso](#uso)
* [Agregar repositorios](#agregar-repositorios-propios)
* [Variables de ambiente](#variables-de-ambiente)
* [Instalar una versión de php](#instalar-una-versión-de-php)
  * [Manual](#manual)
  * [Usando archivo .php-version](#usando-archivo-.php-version)

## Instalación

### Local

1. Clonar el repositorio en ~/.phpdock
```bash
$ git clone git@github.com:lucasdc6/phpdock.git ~/.phpdock
```

2. Agregar la variable de ambiente y el  directorio ~/.phpdock/bin 
para contar con todos los ejecutables
```bash
$ echo 'export PHPDOCKPATH=$HOME/.phpdock' >> ~/.bash_profile
$ echo 'export PATH="$HOME/.phpdock/bin:$PATH"' >> ~/.bash_profile
```

3. Agregar la sentencia eval al bashrc
```bash
$ echo 'eval "$(phpdock init -)' >> ~/.bash_profile
```
En Ubuntu modificar ~/.bashrc

En Zsh modificar ~/.zshrc

4. Reiniciar la terminar para efectuar los cambios.


## Uso

Con el fin de facilitar el uso de los script php y php-server, se provee este
script con 5 opciones relacionadas al manejo de versiones:
  * Setear versión global (requiere reinicio de terminal)
  * Setear versión local (no requiere reinicio de terminal)
  * Instalar una versión (docker pull de los repositorios dados)
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

Las imágenes tagueadas con un "cli" en su nombre serán utilizadas por el script
php, mientras que las "apache", serán utilizadas por el script php-server

De seguir esta regla, solo hace falta agregar el repositorio de la siguiente
manera:

```bash
  $ phpdock repositories --add <NOMBRE DEL REPOSITORIO>
```

Por ejemplo, para agregar el repositorio oficial de php, solo hace falta

ejecutar:

```bash
  $ phpdock repositories --add php
```

Como se puede notar, las imágenes en este repositorio son tagueadas siguiendo la
regla anteriormente nombrada.

## Variables de ambiente

Para el correcto uso de este script, se debe entender que funciona seteando
variables de ambiente que usará el script php y php-server.
Este script **NO** instala ninguna versión de php provistas por el sistema, sino
que simplemente baja la imagen docker del repositorio especificado.

Variable | Descripción
---------|------------
`PHP_CLI_DOCKER_IMAGE` | Variable para especificar versión de imagen php cli
`PHP_SERVER_DOCKER_IMAGE` | Variable para especificar versión de imagen php con apache
`PHPDOCK_DEBUG` | Muestra información de debug
`PHPDOCKPATH` | Dirección raíz del programa phpdock

## Archivos de versiones

### Versión global

- Archivo modificado por el comando `phpdock global <version>`
- Guardado en `$PHPDOCKPATH/etc/php-version` y `$PHPDOCKPATH/etc/apache-version`
- Baja precedencia.

### Versión local

- Archivo modificado por el comando `phpdock local <version>`
- Guardado en el contexto de ejecución del comando
- Media precedencia.

### Versión de la shell (En desarrollo!)

- Manejado mediante variables de ambiente por el comando `phpdock shell <version>`
-Alta precedencia.

## Instalar una versión de php

Si bien phpdock no instala versiones de php, sino que clona imágenes docker y
las acondiciona de manera que sea transparente su uso para el programador, vamos
a referirnos a la acción de clonar dichas imágenes como instalación.

Existen 2 maneras de instalar una nueva versión de php:

### Manual

La manera manual de instalar una nueva versión es la siguiente:

1. Primero se debe conocer el repositorio y la versión (tag de docker) de la
   imagen a instalar.

   Para esto se puede consultar el comando "install" con la opción "--list":

   ```bash
    phpdock install --list
    # lista de versiones
    ```
2. Una vez reconocido el nombre y versión de la imagen, se debe simplemente
   especificarlo de la siguiente manera:
   Por ejemplo, vamos a instalar la versión 7.1.9 del repositorio docker oficial
   de php.

   ```bash
    phpdock install php:7.1.9
   ```

### Usando archivo .php-version

Si se conoce la versión de php se se va a utilizar en el proyecto de antemano,
se puede crear un archivo llamado ".php-version", en el cual se especifique
dicha versión, para facilitar la búsqueda de la imagen docker ideal para su
proyecto.

Una vez creado el archivo, simplemente hace falta ejecutar el comando "install"
de phpdock sin ningún argumento, de la siguiente manera:

   ```bash
    phpdock install
   ```

Con esto, se desplazará un menú con todas las imágenes docker de los
repositorios que cumplan con dicha versión.
Una vez escrito el número y presionado enter, comenzara el proceso de pull de la
imagen docker.
