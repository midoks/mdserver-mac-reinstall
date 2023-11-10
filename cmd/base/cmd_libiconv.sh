#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libiconv start'

if [ ! -f $MDIR/source/cmd/libiconv-1.15.tar.gz ];then
	wget -O $MDIR/source/cmd/libiconv-1.15.tar.gz https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz
fi



if [ ! -d $DIR/cmd/libiconv ];then
	if [ ! -d $MDIR/source/cmd/libiconv-1.15 ];then
		cd $MDIR/source/cmd &&  tar -zxvf libiconv-1.15.tar.gz
	fi
	cd $MDIR/source/cmd/libiconv-1.15
	./configure --prefix=$DIR/cmd/libiconv && \
	make && make install && make clean
fi

if [ -d $MDIR/source/cmd/libiconv-1.15 ];then
	rm -rf $MDIR/source/cmd/libiconv-1.15
fi

echo 'libiconv end'