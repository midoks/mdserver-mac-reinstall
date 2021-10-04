#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


mkdir -p $MDIR/source/gearman


VERSION=1.1.18

if [ ! -f $MDIR/source/gearman/gearman-${VERSION}.tar.gz ]; then
	wget -O $MDIR/source/gearman/gearman-${VERSION}.tar.gz https://github.com/gearman/gearmand/releases/download/${VERSION}/gearmand-${VERSION}.tar.gz
fi

if [ ! -d $MDIR/source/gearman/gearmand-${VERSION} ]; then
	cd $MDIR/source/gearman && tar -zxvf $MDIR/source/gearman/gearman-${VERSION}.tar.gz
fi

cd $MDIR/source/gearman/gearmand-${VERSION}


if [ ! -d $DIR/gearman ]; then


./configure --prefix=$DIR/gearman
make && make install && make clean

fi
