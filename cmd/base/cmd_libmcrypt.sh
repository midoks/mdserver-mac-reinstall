#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libmcrypt start'

if [ ! -f $MDIR/source/cmd/libmcrypt-2.5.8.tar.gz ];then
	wget --no-check-certificate -O $MDIR/source/cmd/libmcrypt-2.5.8.tar.gz https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz -T 20
fi



if [ ! -d $DIR/cmd/libmcrypt ];then
	if [ ! -d $MDIR/source/cmd/libmcrypt-2.5.8 ];then
		cd $MDIR/source/cmd &&  tar -zxvf libmcrypt-2.5.8.tar.gz
	fi

	cd $MDIR/source/cmd/libmcrypt-2.5.8
	./configure --prefix=$DIR/cmd/libmcrypt  && \
	make && make install && make clean
fi

if [ -d $MDIR/source/cmd/libmcrypt-2.5.8 ];then
	rm -rf $MDIR/source/cmd/libmcrypt-2.5.8
fi

echo 'libmcrypt end'