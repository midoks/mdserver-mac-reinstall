#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=ZendGuardLoader

echo "load $LIBNAME start"

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so
if [ ! -f $extFile ]; then
	echo "load $LIBNAME fail"
	exit 1
fi

echo "" >> $DIR/php/php$VERSION/etc/php.ini
echo "[zendguardloader]" >> $DIR/php/php$VERSION/etc/php.ini
echo "zend_extension=${LIBNAME}.so" >> $DIR/php/php$VERSION/etc/php.ini
echo "zend_loader.enable=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "zend_loader.obfuscation_level_support=6" >> $DIR/php/php$VERSION/etc/php.ini

$MDIR/bin/reinstall/reload.sh $VERSION

echo "load $LIBNAME end"