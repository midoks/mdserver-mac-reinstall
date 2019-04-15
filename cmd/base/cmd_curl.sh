#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'brew curl start'
brew install curl
brew upgrade curl
echo 'brew curl start'

echo 'curl start'


VERSION=7.64.1

if [ ! -f $MDIR/source/cmd/curl-${VERSION}.tar.gz ];then
	wget -O $MDIR/source/cmd/curl-${VERSION}.tar.gz https://curl.haxx.se/download/curl-${VERSION}.tar.gz
fi

if [ ! -d $MDIR/source/cmd/${VERSION} ];then
	cd $MDIR/source/cmd &&  tar -zxvf curl-${VERSION}.tar.gz
fi

if [ ! -d $DIR/cmd/curl ];then

cd $MDIR/source/cmd/curl-${VERSION}
./configure --prefix=$DIR/cmd/curl --with-ssl=$DIR/cmd/openssl && \
make && make install && make clean
fi


echo 'curl end'