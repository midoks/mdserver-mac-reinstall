#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=curl
EXT_VERION=no-debug-non-zts-20200930
LIBV='0'

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "cURL support"`

echo "install $LIBNAME start"

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG
if [ "$FIND_IS_INSTALL" != "" ]; then
	echo "install $LIBNAME end"	
	exit 0
fi

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/${EXT_VERION}/${LIBNAME}.so
isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ -f  $extFile ]; then
	rm -rf $extFile
fi

LIB_DEPEND_DIR=`brew info curl | grep /usr/local/Cellar/curl | cut -d \  -f 1 | awk 'END {print}'`

echo "$LIBNAME-DIR:"
echo $LIB_DEPEND_DIR


LIB_OPENSSL_DEPEND_DIR=`brew info openssl | grep /usr/local/Cellar/openssl | cut -d \  -f 1 | awk 'END {print}'`
OPENSSL_PKG=$LIB_OPENSSL_DEPEND_DIR/lib/pkgconfig
export PKG_CONFIG_PATH=$OPENSSL_PKG
echo $PKG_CONFIG_PATH

if [ ! -f "$extFile" ]; then
	cd $MDIR/source/php/php$VERSION/ext/curl
	$DIR/php/php$VERSION/bin/phpize
	./configure  --with-curl=$LIB_DEPEND_DIR \
	--with-php-config=$DIR/php/php$VERSION/bin/php-config && make && make install && make clean
fi

echo "install $LIBNAME end"
