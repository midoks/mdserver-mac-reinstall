#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=curl
EXT_VERION=no-debug-non-zts-20200930

echo "load $LIBNAME start"

extFile=$DIR/php/php$VERSION/lib/php/extensions/${EXT_VERION}/${LIBNAME}.so
if [ ! -f $extFile ]; then
	echo "load $LIBNAME fail"
	exit 1
fi


echo "" >> $DIR/php/php$VERSION/etc/php.ini
echo "[${LIBNAME}]" >> $DIR/php/php$VERSION/etc/php.ini
echo "extension=${LIBNAME}.so" >> $DIR/php/php$VERSION/etc/php.ini

$MDIR/bin/reinstall/reload.sh $VERSION

echo "load $LIBNAME end"
