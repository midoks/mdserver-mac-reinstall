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


VERSION=2.3.1
SCALE_VERSION=2.12
mkdir -p $MDIR/source/kafka
KAFKA_DIR=$MDIR/source/kafka


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_kafka_install.log
echo "-----------" > $LOG_FILE
echo 'install kafka start'

if [ ! -f $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}.tgz ]; then
	wget -O $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}.tgz http://mirror.bit.edu.cn/apache/kafka/${VERSION}/kafka_${SCALE_VERSION}-${VERSION}.tgz
fi


if [ ! -d $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION} ];then
	cd $KAFKA_DIR && tar -zxvf kafka_${SCALE_VERSION}-${VERSION}.tgz
fi

cd $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}




echo 'install kafka end'
echo "-----------" >> $LOG_FILE