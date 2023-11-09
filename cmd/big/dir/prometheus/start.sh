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

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_prometheus_start.log
echo "start!" > $LOG_FILE

VERSION=2.14.0
mkdir -p $MDIR/source/prometheus
APP_DIR=$MDIR/source/prometheus

mkdir -p $APP_DIR/prometheus_demo/tsdb_dir

cd $APP_DIR/prometheus_demo


is_run=`ps -ef|grep prometheus_demo | grep -v grep | awk '{print $2}'`
echo $is_run
if [ "$is_run" == "" ];then

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

fi


is_run=`ps -ef|grep mysqld_exporter | grep -v grep | awk '{print $2}'`
if [ "$is_run" == "" ];then



echo '[client]
host=127.0.0.1
user=root
password=root
' > $APP_DIR/mysqld_exporter_demo/.my.cnf

$APP_DIR/mysqld_exporter_demo/mysqld_exporter \
--config.my-cnf="$APP_DIR/mysqld_exporter_demo/.my.cnf" &

fi












echo "ok!"