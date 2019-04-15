#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'zlib start'

if [ ! -f $MDIR/source/cmd/libzip-1.5.2.tar.xz ];then
	wget -O $MDIR/source/cmd/libzip-1.5.2.tar.xz https://libzip.org/download/libzip-1.5.2.tar.xz
fi

if [ ! -d $MDIR/source/cmd/libzip-1.5.2 ];then
	cd $MDIR/source/cmd &&  tar -Jxf libzip-1.5.2.tar.xz
fi


if [ ! -d $DIR/cmd/libzip ];then

cd $MDIR/source/cmd/libzip-1.5.2
./configure --prefix=$DIR/cmd/libzip && make && make install && make clean

fi
echo 'zlib end'

