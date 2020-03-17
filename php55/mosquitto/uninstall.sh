#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=mosquitto

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20121212/${LIBNAME}.so

if [ -f "$extFile" ]; then
	rm -f $extFile
	echo "delete php${VERSION} ${LIBNAME} ok"
fi