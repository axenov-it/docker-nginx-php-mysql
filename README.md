# docker-nginx-php-mysql

Build project with docker, docker-compose, nginx, mysql, php

## BASH SCRIPTS

- sh run.sh - start and build docker containers with docker-compose
- clear.sh - clear all containers, images and volumes

## RUNNING WEB APPS

- copy examle hosts from /docker/config/hosts/dev.com to sites-available and rename on your site
- create link your host to sites-enabled
- copy and rename your docker/php/phpVersions/your_versions to /docker/php/Dockerfile
