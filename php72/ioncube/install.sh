#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=ioncube
LIBV='0'
PHP_VERSION='7.2'



echo "install $LIBNAME start"

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extDir=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20170718
extFile=$extDir/${LIBNAME}.so

if [ -f  $extFile ]; then
	rm -rf $extFile
fi

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ ! -f "$extFile" ]; then

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib

	if [ ! -f $php_lib/ioncube_loaders_dar_x86-64.tar.gz ]; then
		wget -O $php_lib/ioncube_loaders_dar_x86-64.tar.gz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz
		
	fi

	cd $php_lib/ioncube

	if [ ! -d $php_lib/${LIBNAME}-${LIBV} ]; then
		cd $php_lib
		tar xvf ioncube_loaders_dar_x86-64.tar.gz
	fi

	cd $php_lib/ioncube
	cp $php_lib/ioncube/ioncube_loader_dar_${PHP_VERSION}.so $extDir/ioncube.so
fi

echo "install $LIBNAME end"
