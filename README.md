# phpdock

phpdock is a version manager from the language php, powered with
[Docker](https://github.com/docker), using principally the
[oficial php repository](https://hub.docker.com/\_/php/) in Docker Hub.

phpdock is inspired in [rbenv](https://github.com/rbenv/rbenv),
[goenv](https://github.com/syndbg/goenv) and [pyenv](https://github.com/pyenv/pyenv)

## Contents

* [Install](#install)
  * [Local](#local)
* [Use](#use)
* [Add repositories](#add-repositories)
* [Environment variables](#environment-variables)
* [Install a new php version](#install-php-version)
  * [Manually](#manually)
  * [Using .php-version file](#using-php-version-file)

## Install

### Local

1. Clone phpdock into ~/.phpdock
```bash
$ git clone git@github.com:lucasdc6/phpdock.git ~/.phpdock
```

2. Add to the directory ~/.phpdock/bin to `$PATH`
```bash
$ echo 'export PATH="$HOME/.phpdock/bin:$PATH"' >> ~/.bash_profile
```

3. Add the file php_global and the variable `$PHPDOCKPATH` to the bashrc
```bash
$ echo 'source ~/.phpdock/etc/php_global' >> ~/.bash_profile
$ echo 'export PHPDOCKPATH="$HOME/.phpdock"' >> ~/.bash_profile
```
*Ubuntu desktop note:* Modify your `~/.bashrc` instead of `~/.bash_profile`

*Zsh note:* Modify ~/.zshrc

4. Restart your shell so that PATH changes take effect. (Opening a new terminal
tab will usually do it.)


## Use

The script `phpdock` is intended to facilitate the use of the scripts
`php` and `php-server` (See bin directory)
Availables scripts commands:
  * Set a global php version (shell restart is needed)
  * Set a local php version (shell restart isn't needed)
  * Install docker php images (and php with apache!!)
  * List installed versions
  * List availables versions on docker repositories

Manage availables repositories:
  * List repositories
  * Add repository
  * Delete repository

The availables repositories is stored in a file in `etc` directory

Repositories file use complete docker repositories name.

*Don't* delete the repositories file!

## Add repositories

All the repositories added, need docker images with a specific tag format.

Tag format:

All the tags need one of the following words:

* cli: To php images (used by `php` script)
* apache: To php with apache images (user by `php-server` script)

The format is taken from the php oficial repository
(see [oficial php repository](https://hub.docker.com/\_/php/))

Add a repository
```bash
  $ phpdock repositories --add <COMPLETE_REPOSITORY_NAME>
```

Eg:
Add the oficial php repository (added by default)

```bash
  $ phpdock repositories --add php
```

## Environment variables

The script *doesn't* install php binaries!
The script pull docker images and reference those images via envoiroment
varialbes, used by the scripts `php` and `php-server`

Variable | Description
---------|------------
`PHP_CLI_DOCKER_IMAGE` | Specify a docker image to `php` script
`PHP_SERVER_DOCKER_IMAGE` | Specify a docker image to `php-server` script
`PHPDOCK_DEBUG` | Enable debug mode
`PHPDOCKPATH` | Root path to repository

## Install php version

### Manual

Add a new php version:

1. Firts, search the *complete* docker image name (repository+tag)

   Show all availables docker images in known repositories:

   ```bash
    phpdock install --list
    # docker image's list
    ```
2. Once identified the docker image, send it as argument to `phpdock install`
   Eg, we need the php 7.2.0 from oficial repository

   ```bash
    phpdock install php:7.2.0-cli
   ```

### Using .php-version file

If you know the php version needed for the project, you can create a file named
`.php-version` and put the version (only the number).

This make easiest to export the project.

Once created the file, run the follow:
   ```bash
    phpdock install
   ```
This show you a selectable menu with all docker images that match the version
specified
