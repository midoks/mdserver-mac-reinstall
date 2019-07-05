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

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.cafile"`

echo "install $LIBNAME start"

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG
if [ "$FIND_IS_INSTALL" != "" ]; then
	echo "install $LIBNAME end"	
	exit 0
fi


sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20160303/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ -f  $extFile ]; then
	rm -rf $extFile
fi


LIB_DEPEND_DIR=`brew info openssl | grep /usr/local/Cellar/openssl | cut -d \  -f 1`

echo "$LIBNAME-DIR:"
echo $LIB_DEPEND_DIR

if [ ! -f "$extFile" ]; then
	cd $MDIR/source/php/php$VERSION/ext/openssl

	if [ -f $MDIR/source/php/php$VERSION/ext/openssl/config0.m4 ]; then
		mv $MDIR/source/php/php$VERSION/ext/openssl/config0.m4 $MDIR/source/php/php$VERSION/ext/openssl/config.m4
	fi

	$DIR/php/php$VERSION/bin/phpize
	./configure  --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-openssl=$LIB_DEPEND_DIR && make && make install && make clean
fi

echo "install $LIBNAME end"
