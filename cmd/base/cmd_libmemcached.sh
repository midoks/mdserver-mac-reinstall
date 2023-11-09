#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libmemcached start'

if [ ! -f $MDIR/source/cmd/libmemcached-1.0.4.tar.gz ];then
	wget -O $MDIR/source/cmd/libmemcached-1.0.4.tar.gz https://launchpadlibrarian.net/91217116/libmemcached-1.0.4.tar.gz
fi

if [ ! -d $MDIR/source/cmd/libmemcached-1.0.4 ];then
	cd $MDIR/source/cmd &&  tar -zxvf libmemcached-1.0.4.tar.gz
fi


if [ ! -d $DIR/cmd/libmemcached ];then

cd $MDIR/source/cmd/libmemcached-1.0.4
./configure --prefix=$DIR/cmd/libmemcached --with-memcached && make && make install && make clean

fi
echo 'libmemcached end'

