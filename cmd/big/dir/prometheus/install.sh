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




echo 'install prometheus end'