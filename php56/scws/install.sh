#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=scws
LIBV='1.2.1'

echo "install $LIBNAME start"

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20131226/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ ! -f "$extFile" ]; then

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib
	mkdir -p $MDIR/source/cmd

	if [ ! -f $MDIR/source/cmd/${LIBNAME}-${LIBV}.tar.bz2 ]; then
		wget -O $MDIR/source/cmd/${LIBNAME}-${LIBV}.tar.bz2 http://www.xunsearch.com/scws/down/${LIBNAME}-${LIBV}.tar.bz2
		
	fi
	
	if [ ! -d $MDIR/source/cmd/scws-1.2.1 ];then
		cd $MDIR/source/cmd &&  tar zxvf scws-1.2.1.tar.bz2
	fi

	cd $MDIR/source/cmd/scws-1.2.1/phpext

	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config --with-scws=$DIR/cmd/scws && make && make install
fi

echo "install $LIBNAME end"
