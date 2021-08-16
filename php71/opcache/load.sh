#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=opcache

echo "load $LIBNAME start"


NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so
if [ ! -f $extFile ]; then
	echo "load $LIBNAME fail"
	exit 1
fi

echo "" >> $DIR/php/php$VERSION/etc/php.ini
echo "[${LIBNAME}]" >> $DIR/php/php$VERSION/etc/php.ini
echo "zend_extension=${LIBNAME}.so" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.enable=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.memory_consumption=128" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.interned_strings_buffer=8" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.max_accelerated_files=4000" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.revalidate_freq=60" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.fast_shutdown=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.enable_cli=1" >> $DIR/php/php$VERSION/etc/php.ini

$MDIR/bin/reinstall/reload.sh $VERSION

echo "load $LIBNAME end"