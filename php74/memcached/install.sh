#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=memcached
EXT_VERSION=no-debug-non-zts-20190902
LIBV=3.1.4

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG

FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.compression_factor" `

echo "install $LIBNAME start"

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG
if [ "$FIND_IS_INSTALL" != "" ]; then
	echo "install $LIBNAME end"	
	exit 0
fi

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/${EXT_VERSION}/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi


if [ ! -f "$extFile" ]; then

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib

	if [ ! -f $php_lib/${LIBNAME}-${LIBV}.tgz ]; then
		wget -O $php_lib/${LIBNAME}-${LIBV}.tgz http://pecl.php.net/get/${LIBNAME}-${LIBV}.tgz
		
	fi
	cd $php_lib/${LIBNAME}-${LIBV}
	if [ ! -d $php_lib/${LIBNAME}-${LIBV} ]; then
		cd $php_lib
		tar xvf ${LIBNAME}-${LIBV}.tgz
	fi

	cd $php_lib/${LIBNAME}-${LIBV}
	#https://github.com/php-memcached-dev/php-memcached/pull/445/commits/26468eb072b4f18a53d218ba9055c437e535dd21
	sed -i '_bak' "3237,3238s#ulong#zend_ulong#g" $php_lib/${LIBNAME}-${LIBV}/php_memcached.c

	$DIR/php/php$VERSION/bin/phpize
	./configure \
	--with-php-config=$DIR/php/php$VERSION/bin/php-config  \
	--with-libmemcached-dir=$DIR/cmd/libmemcached \
	--with-zlib-dir=$DIR/cmd/zlib && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
