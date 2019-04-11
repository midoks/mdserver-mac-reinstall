#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libmcrypt start'

if [ ! -f $MDIR/source/cmd/libmcrypt-2.5.8.tar.gz ];then
	wget -O $MDIR/source/cmd/libmcrypt-2.5.8.tar.gz https://sourceforge.mirrorservice.org/m/mc/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
fi

if [ ! -d $MDIR/source/cmd/libmcrypt-2.5.8 ];then
	cd $MDIR/source/cmd &&  tar -zxvf libmcrypt-2.5.8.tar.gz
fi

if [ ! -d $DIR/cmd/libmcrypt ];then

cd $MDIR/source/cmd/libmcrypt-2.5.8
./configure --prefix=$DIR/cmd/libmcrypt  && \
make && make install && make clean

fi


echo 'libmcrypt end'