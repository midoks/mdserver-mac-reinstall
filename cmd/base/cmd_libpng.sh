#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libpng start'

if [ ! -f $MDIR/source/cmd/libpng-1.6.28.tar.xz ];then
	wget -O $MDIR/source/cmd/libpng-1.6.28.tar.xz http://ftp.lfs-matrix.net/pub/blfs/conglomeration/libpng/libpng-1.6.28.tar.xz
fi

if [ ! -d $MDIR/source/cmd/libpng-1.6.28 ];then
	cd $MDIR/source/cmd &&  tar zxvf libpng-1.6.28.tar.xz
fi

if [ ! -d $DIR/cmd/libpng ]; then

cd $MDIR/source/cmd/libpng-1.6.28/
echo `pwd`
echo $MDIR/source/cmd/libpng-1.6.28
./configure --prefix=$DIR/cmd/libpng && make && make install && make clean

fi

echo 'libpng end'