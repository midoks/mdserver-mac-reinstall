#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'libevent start'

VERSION=1.4.15

if [ ! -f $MDIR/source/cmd/libevent-${VERSION}.tar.gz ];then
	echo "wget --no-check-certificate -O $MDIR/source/cmd/libevent-${VERSION}.tar.gz https://github.com/libevent/libevent/archive/release-${VERSION}-stable.tar.gz"
	wget --no-check-certificate -O $MDIR/source/cmd/libevent-${VERSION}.tar.gz https://github.com/libevent/libevent/archive/release-${VERSION}-stable.tar.gz
fi




if [ ! -d $DIR/cmd/libevent ];then

	if [ ! -d $MDIR/source/cmd/libevent-release-${VERSION}-stable ];then
		cd $MDIR/source/cmd &&  tar -zxvf libevent-${VERSION}.tar.gz
	fi

	cd $MDIR/source/cmd/libevent-release-${VERSION}-stable
	./autogen.sh
	./configure --prefix=$DIR/cmd/libevent --disable-debug-mode --disable-dependency-tracking
	make && make install && make clean

	# ln -s  $DIR/cmd/libevent-1.2/lib/libevent-1.2.1.0.3.dylib /usr/local/lib/libevent-1.2.1.0.3.dylib  
	# ln -s  $DIR/cmd/libevent-1.2/lib/libevent-1.2.1.dylib /usr/local/lib/libevent-1.2.1.dylib 
fi

# if [ -d $MDIR/source/cmd/libevent-release-${VERSION}-stable ];then
# 	rm -rf $MDIR/source/cmd/libevent-release-${VERSION}-stable
# fi
echo 'libevent end'

