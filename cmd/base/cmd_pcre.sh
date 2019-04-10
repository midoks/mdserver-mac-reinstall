#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'pcre start'

if [ ! -f $MDIR/source/cmd/pcre-8.38.tar.gz ];then
	wget -O $MDIR/source/cmd/pcre-8.38.tar.gz https://ftp.pcre.org/pub/pcre/pcre-8.38.tar.gz
fi

if [ ! -d $MDIR/source/cmd/pcre-8.38 ];then
	cd $MDIR/source/cmd &&  tar -zxvf pcre-8.38.tar.gz
fi

if [ ! -d $DIR/cmd/pcre ];then

cd $MDIR/source/cmd/pcre-8.38
./configure --prefix=$DIR/cmd/pcre --enable-utf8 && \
make && make install && make clean
fi

echo 'pcre end'