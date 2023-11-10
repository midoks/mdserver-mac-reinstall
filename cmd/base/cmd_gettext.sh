#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'gettext start'

if [ ! -f $MDIR/source/cmd/gettext-0.19.4.tar.gz ];then
	wget --no-check-certificate -O $MDIR/source/cmd/gettext-0.19.4.tar.gz http://ftp.gnu.org/pub/gnu/gettext/gettext-0.19.4.tar.gz
fi


if [ ! -d $DIR/cmd/gettext ];then

	if [ ! -d $MDIR/source/cmd/gettext-0.19.4 ];then
		cd $MDIR/source/cmd &&  tar -zxvf gettext-0.19.4.tar.gz
	fi

	cd $MDIR/source/cmd/gettext-0.19.4
	./configure --prefix=$DIR/cmd/gettext && \
	make && make install && make clean
fi

if [ -d $MDIR/source/cmd/gettext-0.19.4 ];then
	rm -rf $MDIR/source/cmd/gettext-0.19.4
fi



echo 'gettext end'