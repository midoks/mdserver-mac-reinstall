#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=intl
LIBV=0

#check
echo "extension=$LIBNAME.so" > /tmp/t_php_conf.ini
FIND_IS_INSTALL=$($DIR/php/php$VERSION/bin/php -c /tmp/t_php_conf.ini -r 'phpinfo();' |grep $LIBNAME | grep Reason)

echo "install $LIBNAME start"

if [ "$FIND_IS_INSTALL" == "" ]; then
	echo "install $LIBNAME end"
	exit 0
fi
rm -rf /tmp/t_php_conf.ini

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20180731/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ -f  $extFile ]; then
	rm -rf $extFile
fi

LIB_DEPEND_DIR=`brew info icu4c | grep /usr/local/Cellar/icu4c | cut -d \  -f 1 | awk 'END {print}'`

echo "$LIBNAME-DIR:"
echo $LIB_DEPEND_DIR

if [ ! -f "$extFile" ]; then

	cd $MDIR/source/php/php${VERSION}/ext/intl
	$DIR/php/php$VERSION/bin/phpize
	echo `pwd`
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-icu-dir=$LIB_DEPEND_DIR  && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
