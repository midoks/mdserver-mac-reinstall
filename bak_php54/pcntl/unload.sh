#! /bin/bash
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=pcntl

echo "unload $LIBNAME start"

sed -i '_bak' "/${LIBNAME}.so/d"  $DIR/php/php$VERSION/etc/php.ini
sed -i '_bak' "/${LIBNAME}/d" $DIR/php/php$VERSION/etc/php.ini
sed -i '_bak' '/^$/N;/^\n$/D' $DIR/php/php$VERSION/etc/php.ini

rm -rf $DIR/php/php$VERSION/etc/php.ini_bak

$MDIR/bin/reinstall/reload.sh $VERSION

echo "unload $LIBNAME end"