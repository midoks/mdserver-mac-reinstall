#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'scws start'

if [ ! -f $MDIR/source/cmd/scws-1.2.1.tar.bz2 ];then
	wget -O $MDIR/source/cmd/scws-1.2.1.tar.bz2 http://www.xunsearch.com/scws/down/scws-1.2.1.tar.bz2
fi

if [ ! -d $MDIR/source/cmd/scws-1.2.1 ];then
	cd $MDIR/source/cmd &&  tar zxvf scws-1.2.1.tar.bz2
fi

if [ ! -d $DIR/cmd/scws ];then

cd  $MDIR/source/cmd/scws-1.2.1
./configure --prefix=$DIR/cmd/scws && make && make install && make clean
fi


echo 'scws end'