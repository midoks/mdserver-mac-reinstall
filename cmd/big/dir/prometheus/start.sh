#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_prometheus_start.log
echo "start!" > $LOG_FILE

VERSION=2.14.0
mkdir -p $MDIR/source/prometheus
APP_DIR=$MDIR/source/prometheus

mkdir -p $APP_DIR/prometheus_demo/tsdb_dir

cd $APP_DIR/prometheus_demo

echo "$APP_DIR/prometheus_demo/prometheus \
--config.file $APP_DIR/prometheus_demo/prometheus.yml \
--storage.tsdb.path $APP_DIR/prometheus_demo/tsdb_dir \
--web.console.templates=$APP_DIR/prometheus_demo/consoles \
--web.console.libraries=$APP_DIR/prometheus_demo/console_libraries"
$APP_DIR/prometheus_demo/prometheus \
--config.file $APP_DIR/prometheus_demo/prometheus.yml \
--storage.tsdb.path $APP_DIR/prometheus_demo/tsdb_dir \
--web.console.templates=$APP_DIR/prometheus_demo/consoles \
--web.console.libraries=$APP_DIR/prometheus_demo/console_libraries &











echo "ok!"