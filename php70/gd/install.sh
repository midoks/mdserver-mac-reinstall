#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=gd
LIBV='v'

echo "install $LIBNAME start"

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20151012/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ ! -f "$extFile" ]; then

	cd $MDIR/source/php/php${VERSION}/ext/gd
	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-zlib-dir=$DIR/cmd/zlib \
	--with-png-dir=$DIR/cmd/libpng \
	--with-freetype-dir=$DIR/cmd/freetype \
	--with-jpeg-dir=$DIR/cmd/libjpeg && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
