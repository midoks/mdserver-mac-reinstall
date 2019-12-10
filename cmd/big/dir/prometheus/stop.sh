#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_prometheus_stop.log
echo "stop!" > $LOG_FILE

VERSION=2.14.0
mkdir -p $MDIR/source/prometheus
APP_DIR=$MDIR/source/prometheus

ps -ef|grep prometheus | grep -v grep | awk '{print $2}' | xargs kill

echo "ok!"