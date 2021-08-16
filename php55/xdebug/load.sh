#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=xdebug

echo "load $LIBNAME start"

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20121212/${LIBNAME}.so
if [ ! -f $extFile ]; then
	echo "load $LIBNAME fail"
	exit 1
fi

echo "" >> $DIR/php/php$VERSION/etc/php.ini
echo "[${LIBNAME}]" >> $DIR/php/php$VERSION/etc/php.ini
echo "zend_extension=${LIBNAME}.so" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.profiler_enable=on" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.auto_trace=on" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.trace_output_dir=/Applications/mdserver/bin/tmp/xdebug" >> $DIR/php/php$VERSION/etc/php.ini
echo "${LIBNAME}.profiler_output_dir=/Applications/mdserver/bin/tmp/xdebug" >> $DIR/php/php$VERSION/etc/php.ini

$MDIR/bin/reinstall/reload.sh $VERSION

echo "load $LIBNAME end"