#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'zlib start'

if [ ! -f $MDIR/source/cmd/zlib-1.2.11.tar.gz ];then
	wget -O $MDIR/source/cmd/zlib-1.2.11.tar.gz http://www.zlib.net/zlib-1.2.11.tar.gz
fi

if [ ! -d $MDIR/source/cmd/zlib-1.2.11 ];then
	cd $MDIR/source/cmd &&  tar -zxvf zlib-1.2.11.tar.gz
fi


if [ ! -d $DIR/cmd/zlib ];then

cd $MDIR/source/cmd/zlib-1.2.11
./configure --prefix=$DIR/cmd/zlib && make && make install && make clean

fi
echo 'zlib end'

