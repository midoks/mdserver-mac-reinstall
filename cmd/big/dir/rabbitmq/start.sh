#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

# VERSION=8.3.0
APP_NAME=rabbitmq
APP_DIR=$MDIR/source/${APP_NAME}
mkdir -p $APP_DIR

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_${APP_NAME}_start.log
echo "-----------" > $LOG_FILE
echo "start ${APP_NAME} start"

brew services start rabbitmq


echo "start ${APP_NAME} end"
echo "-----------" >> $LOG_FILE