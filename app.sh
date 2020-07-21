ACTION="$1"
BASE_DIR=$(pwd)
AVAILABLE_DIR=$BASE_DIR/docker/nginxServer/config/sites-available
ENABLED_DIR=$BASE_DIR/docker/nginxServer/config/sites-enabled
HOSTS_DIR=$BASE_DIR/docker/nginxServer/config/hosts
PHP_DIR=$BASE_DIR/docker/php

if [ "$ACTION" = "create-host" ]; then
  read -p 'Enter host name: ' NAME
  # copy from /nginxServer/config/host to nginxServer/config/sites-available/$NAME
  cp $HOSTS_DIR/example.conf $AVAILABLE_DIR/$NAME.conf

  # rewrite {host_name} in nginxServer/config/sites-available/$NAME 
  sed -i "s/{host_name}/$NAME/g" $AVAILABLE_DIR/$NAME.conf

  # create link from /nginxServer/config/sites-enabled/$NAME to /nginxServer/config/sites-available/$NAME
  ln -s $AVAILABLE_DIR/$NAME.conf $ENABLED_DIR/$NAME.conf

  # create app dir if not exists /apps/$NAME
  mkdir -p $BASE_DIR/apps/$NAME

  #write host to /etc/hosts file
  sudo sh -c "echo 127.0.0.1  $NAME >> /etc/hosts"
elif [ "$ACTION" = "delete-host" ]; then
  read -p 'Enter host name: ' NAME
  # delete host files
  rm -f $AVAILABLE_DIR/$NAME.conf & rm -f $ENABLED_DIR/$NAME.conf
elif [ "$ACTION" = "php" ]; then
  read -p 'Enter php version: ' NAME
  rm $PHP_DIR/Dockerfile
  cp $PHP_DIR/phpVersions/Dockerfile.php$NAME-fpm $PHP_DIR/Dockerfile
elif [ "$ACTION" = "run" ]; then
  # build and run docker container  
  docker-compose up -d --build
elif [ "$ACTION" = "clear" ]; then
  # clear docker containers, images, volumes
  docker-compose down
  docker-compose down -v
  docker system prune -a --volumes -f
else
    echo 'Enter command: run | clear | create-host | delete-host'
    exit
fi
