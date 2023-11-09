#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libzip start'

if [ ! -f $MDIR/source/cmd/libzip-1.2.0.tar.gz ];then
	wget -O $MDIR/source/cmd/libzip-1.2.0.tar.gz https://nih.at/libzip/libzip-1.2.0.tar.gz
fi

if [ ! -d $MDIR/source/cmd/libzip-1.2.0 ];then
	cd $MDIR/source/cmd &&  tar -zxvf libzip-1.2.0.tar.gz
fi


if [ ! -d $DIR/cmd/libzip ];then

cd $MDIR/source/cmd/libzip-1.2.0
./configure --prefix=$DIR/cmd/libzip && make && make install && make clean

fi
echo 'libzip end'

