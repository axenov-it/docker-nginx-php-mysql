# docker-nginx-php-mysql

Build project with docker, docker-compose, nginx, mysql, php

## BASH SCRIPTS

- sh app.sh run - start and build docker containers with docker-compose
- sh app.sh clear - clear all containers, images and volumes
- sh app.sh create-host - generate files for virtual host
- sh app.sh delete-host - delete virtual host files
- sh app.sh php {php_version} - generate php Docker compose config

## RUNNING WEB APPS

- copy examle hosts from /docker/config/hosts/dev.com to sites-available and rename on your site
- create link your host to sites-enabled
- copy and rename your docker/php/phpVersions/your_versions to /docker/php/Dockerfile
