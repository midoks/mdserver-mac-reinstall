#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


VERSION=2.2.2
mkdir -p $MDIR/source/hbase
APP_DIR=$MDIR/source/hbase


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_hbase_install.log
echo "-----------" > $LOG_FILE
echo 'install hbase start'

if [ ! -f $APP_DIR/hbase-${VERSION}.tgz ]; then
	wget -O $APP_DIR/hbase-${VERSION}.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/hbase/${VERSION}/hbase-${VERSION}-bin.tar.gz
fi


if [ ! -d $APP_DIR/hbase-${VERSION} ];then
	cd $APP_DIR && tar -zxvf hbase-${VERSION}.tgz
fi

cd $APP_DIR/hbase-${VERSION}

echo 'install hbase end'
echo "-----------" >> $LOG_FILE