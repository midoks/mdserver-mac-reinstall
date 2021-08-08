#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")
#echo $DIR

mkdir -p $MDIR/source/redis

VERSION=6.2.5

if [ ! -f $MDIR/source/redis/redis-${VERSION}.tar.gz ];then
	wget -O $MDIR/source/redis/redis-${VERSION}.tar.gz http://download.redis.io/releases/redis-${VERSION}.tar.gz
fi

if [ ! -d $MDIR/source/redis/redis-${VERSION} ];then
	cd $MDIR/source/redis && tar -zxvf $MDIR/source/redis/redis-${VERSION}.tar.gz
fi


if [ ! -d $DIR/redis ];then
	cd $MDIR/source/redis/redis-${VERSION}
	
	make PREFIX=$DIR/redis install
	make clean

	if [ ! -f $DIR/redis/etc/redis.conf ];then
		mkdir -p $DIR/redis/etc
		mkdir -p $DIR/redis/data
		cp $MDIR/bin/reinstall/tpl/redis/redis.conf $DIR/redis/etc/
		sed -i '_bak' "s#{PATH}#${DIR}#g" $DIR/redis/etc/redis.conf

		rm -rf $DIR/redis/etc/redis.conf_bak
	fi

fi


