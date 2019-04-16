#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=seaslog

echo "load $LIBNAME start"

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20160303/${LIBNAME}.so
if [ ! -f $extFile ]; then
	echo "load $LIBNAME fail"
	exit 1
fi

echo "" >> $DIR/php/php$VERSION/etc/php.ini
echo "[${LIBNAME}]" >> $DIR/php/php$VERSION/etc/php.ini
echo "extension=${LIBNAME}.so" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.default_basepath=/Applications/mdserver/bin/tmp/logs" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.default_logger=default" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.disting_type=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.disting_by_hour=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.use_buffer=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.buffer_size=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.level=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.trace_error=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.trace_exception=1" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.default_datetime_format=1" >> $DIR/php/php$VERSION/etc/php.ini

echo "load $LIBNAME end"