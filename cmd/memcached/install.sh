#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")



mkdir -p $MDIR/source/memcached

VERSION=1.5.12

if [ ! -f $MDIR/source/memcached/memcached-${VERSION}.tar.gz ];then
	wget -O $MDIR/source/memcached/memcached-${VERSION}.tar.gz https://memcached.org/files/memcached-${VERSION}.tar.gz
fi

if [ ! -d $MDIR/source/memcached/memcached-${VERSION} ];then
	cd $MDIR/source/memcached && tar -zxvf $MDIR/source/memcached/memcached-${VERSION}.tar.gz
fi

if [ ! -f $DIR/memcached ]; then

cd $MDIR/source/memcached/memcached-${VERSION}
./configure --prefix=$DIR/memcached \
--with-libevent=$DIR/cmd/libevent \
--with-zlib-dir=$DIR/cmd/zlib && \
make && make install && make clean

fi