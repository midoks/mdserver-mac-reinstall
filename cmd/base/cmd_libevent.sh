#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libevent start'

if [ ! -f $MDIR/source/cmd/libevent-1.3e.tar.gz ];then
	wget -O $MDIR/source/cmd/libevent-1.3e.tar.gz https://github.com/downloads/libevent/libevent/libevent-1.3e.tar.gz
fi

if [ ! -d $MDIR/source/cmd/libevent-1.3e ];then
	cd $MDIR/source/cmd &&  tar -zxvf libevent-1.3e.tar.gz
fi


if [ ! -d $DIR/cmd/libevent ];then

	cd $MDIR/source/cmd/libevent-1.3e
	./configure --prefix=$DIR/cmd/libevent
	make && make install && make clean

	# ln -s  $DIR/cmd/libevent-1.2/lib/libevent-1.2.1.0.3.dylib /usr/local/lib/libevent-1.2.1.0.3.dylib  
	# ln -s  $DIR/cmd/libevent-1.2/lib/libevent-1.2.1.dylib /usr/local/lib/libevent-1.2.1.dylib 
fi
echo 'libevent end'

