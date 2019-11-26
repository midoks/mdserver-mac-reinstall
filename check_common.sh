#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1

sh $MDIR/bin/reinstall/cmd/brew/install.sh

if [ ! -d /usr/local/Cellar/openssl ];then
	brew install openssl
fi

if [ ! -d /usr/local/Cellar/icu4c ];then
	brew install icu4c
fi

if [ ! -d /usr/local/Cellar/imagemagick ];then
	brew install imagemagick
fi

if [ ! -d /usr/local/Cellar/curl ];then
	brew install curl
fi


if [ ! -d /usr/local/Cellar/wget ];then
	brew install wget
fi

if [ ! -d /usr/local/Cellar/libxml2 ];then
	brew install libxml2
fi

if [ ! -d /usr/local/Cellar/bison ];then
	brew install bison
fi

if [ ! -d /usr/local/Cellar/libevent ];then
	brew install libevent
fi


if [ ! -d $MDIR/source/php/php$VERSION ]; then
	echo "PHP-VERIONS:$VERSION"
	echo "$MDIR/source/php/php$VERSION"
	echo "缺少php$VERSION源码,正在安装..."
	sh $MDIR/bin/reinstall/php$VERSION/install.sh
fi




