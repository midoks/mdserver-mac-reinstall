#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libjpeg start'

if [ ! -f $MDIR/source/cmd/jpegsrc.v9c.tar.gz ];then
	wget -O $MDIR/source/cmd/jpegsrc.v9c.tar.gz http://www.ijg.org/files/jpegsrc.v9c.tar.gz
fi

if [ ! -d $MDIR/source/cmd/jpeg-9c ];then
	cd $MDIR/source/cmd &&  tar -zxvf jpegsrc.v9c.tar.gz
fi

if [ ! -d $DIR/cmd/libjpeg ];then

cd $MDIR/source/cmd/jpeg-9c
./configure --prefix=$DIR/cmd/libjpeg --enable-shared --enable-static && make && make install && make clean
fi


echo 'curl end'