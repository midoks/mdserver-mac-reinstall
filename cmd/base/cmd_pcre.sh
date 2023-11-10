#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'pcre start'

pcreVersion='8.38'

if [ ! -f $MDIR/source/cmd/pcre-${pcreVersion}.tar.gz ];then
	wget --no-check-certificate -O $MDIR/source/cmd/pcre-${pcreVersion}.tar.gz https://netix.dl.sourceforge.net/project/pcre/pcre/${pcreVersion}/pcre-${pcreVersion}.tar.gz
fi

if [ ! -d $DIR/cmd/pcre ];then
	if [ ! -d $MDIR/source/cmd/pcre-${pcreVersion} ];then
		cd $MDIR/source/cmd &&  tar -zxvf pcre-${pcreVersion}.tar.gz
	fi

	if [ ! -d $DIR/cmd/pcre ];then
		cd $MDIR/source/cmd/pcre-${pcreVersion}
		./configure --prefix=$DIR/cmd/pcre && make && make install && make clean
	fi
fi


if [ -d $MDIR/source/cmd/pcre-${pcreVersion} ];then
	rm -rf $MDIR/source/cmd/pcre-${pcreVersion}
fi

echo 'pcre end'