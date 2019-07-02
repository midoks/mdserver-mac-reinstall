#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1

sh $MDIR/bin/reinstall/cmd/brew/install.sh

if [ ! -d $MDIR/source/php/php$VERSION ]; then
	echo "缺少php$VERSION源码,正在安装..."
	sh $MDIR/bin/reinstall/php$VERSION/install.sh
fi


