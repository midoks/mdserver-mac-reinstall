#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=openssl
LIBV='0'

echo "install $LIBNAME start"

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20090626/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ ! -f "$extFile" ]; then
	cd $MDIR/source/php/php$VERSION/ext/openssl

	if [ -f $MDIR/source/php/php$VERSION/ext/openssl/config0.m4 ]; then
		mv $MDIR/source/php/php$VERSION/ext/openssl/config0.m4 $MDIR/source/php/php$VERSION/ext/openssl/config.m4
	fi

	$DIR/php/php$VERSION/bin/phpize
	./configure  --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-openssl=$DIR/cmd/openssl && make && make install
fi

echo "install $LIBNAME end"
