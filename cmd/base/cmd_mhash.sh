#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'mhash start'

if [ ! -f $MDIR/source/cmd/mhash-0.9.9.9.tar.gz ];then
	wget -O $MDIR/source/cmd/mhash-0.9.9.9.tar.gz https://nchc.dl.sourceforge.net/project/mhash/mhash/0.9.9.9/mhash-0.9.9.9.tar.gz
fi

if [ ! -d $MDIR/source/cmd/mhash-0.9.9.9 ];then
	cd $MDIR/source/cmd &&  tar -zxvf mhash-0.9.9.9.tar.gz
fi

if [ ! -d $DIR/cmd/mhash ];then

cd $MDIR/source/cmd/mhash-0.9.9.9
./configure --prefix=$DIR/cmd/mhash && \
make && make install && make clean
fi

echo 'mhash end'