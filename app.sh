ACTON="$1"
NAME="$2"
BASE_DIR=$(pwd)
AVAILABLE_DIR=$BASE_DIR/docker/nginxServer/config/sites-available
ENABLED_DIR=$BASE_DIR/docker/nginxServer/config/sites-enabled
HOSTS_DIR=$BASE_DIR/docker/nginxServer/config/hosts


if [ "$ACTON" = "create-host" ]; then
  cp $HOSTS_DIR/example.conf $AVAILABLE_DIR/$NAME.conf
  ln -s $AVAILABLE_DIR/$NAME.conf $ENABLED_DIR/$NAME.conf
  mkdir $BASE_DIR/apps/$NAME
elif [ "$ACTON" = "delete-host" ]; then
  rm -f $AVAILABLE_DIR/$NAME.conf & rm -f $ENABLED_DIR/$NAME.conf
elif ["$ACTON" = "run"]; then
  docker-compose up -d --build
elif ["$ACTON" = "clear"]; then
  docker-compose down
  docker-compose down -v
  docker system prune -a --volumes -f
else
    echo 'Enter command: run | clear | create-host host_name'
    exit
fi
