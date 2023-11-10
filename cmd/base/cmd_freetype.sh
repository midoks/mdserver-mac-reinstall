#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'freetype start'

if [ ! -f $MDIR/source/cmd/freetype-2.3.5.tar.bz2 ];then
	wget -O $MDIR/source/cmd/freetype-2.3.5.tar.bz2 https://download.savannah.gnu.org/releases/freetype/freetype-old/freetype-2.3.5.tar.bz2
fi

if [ ! -d $DIR/cmd/freetype ];then

	if [ ! -d $MDIR/source/cmd/freetype-2.3.5 ];then
		cd $MDIR/source/cmd &&  tar jxvf freetype-2.3.5.tar.bz2
	fi

	cd $MDIR/source/cmd/freetype-2.3.5
	./configure --prefix=$DIR/cmd/freetype && make && make install && make clean
fi

if [ -d $MDIR/source/cmd/freetype-2.3.5 ];then
	rm -rf $MDIR/source/cmd/freetype-2.3.5
fi

echo 'freetype end'