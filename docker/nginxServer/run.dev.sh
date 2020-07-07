HOSTS_DIR=$(pwd)/config/hosts
EN_DIR=$(pwd)/config/sites-enabled
AV_DIR=$(pwd)/config/sites-available
LOGS_DIR=$(pwd)/logs
ERROR_LOG=$(pwd)/logs/error.log
ACCESS_LOG=$(pwd)/logs/access.log
SEMA_ACCESS_LOG=$(pwd)/logs/semafor.com.ua.access.log
SEMA_ERROR_LOG=$(pwd)/logs/semafor.com.ua.error.log


rm -rf $EN_DIR && rm -rf $AV_DIR && rm -rf $LOGS_DIR

mkdir $EN_DIR && mkdir $AV_DIR && mkdir $LOGS_DIR

touch $ERROR_LOG && touch $ACCESS_LOG && touch $SEMA_ACCESS_LOG && touch $SEMA_ERROR_LOG

cp $HOSTS_DIR/semafor.com.ua.conf $AV_DIR/semafor.com.ua.conf
ln -s $AV_DIR/semafor.com.ua.conf $EN_DIR/semafor.com.ua.conf