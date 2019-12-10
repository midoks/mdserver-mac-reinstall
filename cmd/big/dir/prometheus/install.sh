#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

echo 'install prometheus start'


VERSION=2.14.0
mkdir -p $MDIR/source/prometheus
APP_DIR=$MDIR/source/prometheus


if [ ! -f $APP_DIR/prometheus-${VERSION}.darwin-amd64.tar.gz ]; then
	wget -O $APP_DIR/prometheus-${VERSION}.darwin-amd64.tar.gz https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.darwin-amd64.tar.gz
fi

if [ ! -d $APP_DIR/prometheus_demo ];then
	cd $APP_DIR
	tar -zxvf prometheus-${VERSION}.darwin-amd64.tar.gz

	mv prometheus-${VERSION}.darwin-amd64 prometheus_demo
fi



VERSION=0.18.1
if [ ! -f $APP_DIR/node_exporter-${VERSION}.darwin-amd64.tar.gz ]; then
	wget -O $APP_DIR/node_exporter-${VERSION}.darwin-amd64.tar.gz https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.darwin-amd64.tar.gz
fi

if [ ! -d $APP_DIR/node_exporter_demo ];then
	cd $APP_DIR
	tar -zxvf node_exporter-${VERSION}.darwin-amd64.tar.gz

	mv node_exporter-${VERSION}.darwin-amd64 node_exporter_demo
fi


VERSION=0.12.1
if [ ! -f $APP_DIR/mysqld_exporter-${VERSION}.darwin-amd64.tar.gz ]; then
	wget -O $APP_DIR/mysqld_exporter-${VERSION}.darwin-amd64.tar.gz https://github.com/prometheus/mysqld_exporter/releases/download/v${VERSION}/mysqld_exporter-${VERSION}.darwin-amd64.tar.gz
fi

if [ ! -d $APP_DIR/mysqld_exporter_demo ];then
	cd $APP_DIR
	tar -zxvf mysqld_exporter-${VERSION}.darwin-amd64.tar.gz

	mv mysqld_exporter-${VERSION}.darwin-amd64 mysqld_exporter_demo
fi



echo 'install prometheus end'