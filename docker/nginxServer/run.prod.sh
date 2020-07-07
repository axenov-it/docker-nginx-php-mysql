HOSTS_DIR=$(pwd)/config/hosts
EN_DIR=$(pwd)/config/sites-enabled
AV_DIR=$(pwd)/config/sites-available
LOGS_DIR=$(pwd)/logs
ERROR_LOG=$(pwd)/logs/error.log
ACCESS_LOG=$(pwd)/logs/access.log
SEMA_ACCESS_LOG=$(pwd)/logs/sema.loc.access.log
SEMA_ERROR_LOG=$(pwd)/logs/sema.loc.error.log


rm -rf $EN_DIR && rm -rf $AV_DIR && rm -rf $LOGS_DIR

mkdir $EN_DIR && mkdir $AV_DIR && mkdir $LOGS_DIR

touch $ERROR_LOG && touch $ACCESS_LOG && touch $SEMA_ACCESS_LOG && touch $SEMA_ERROR_LOG

cp $HOSTS_DIR/sema.loc.conf $AV_DIR/sema.loc.conf
ln -s $AV_DIR/sema.loc.conf $EN_DIR/sema.loc.conf