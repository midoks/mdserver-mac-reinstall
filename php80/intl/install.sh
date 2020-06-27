#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=intl
EXT_VERSION=no-debug-non-zts-20190128
LIBV=0

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.default_locale"`
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

if [ -f  $extFile ]; then
	rm -rf $extFile
fi

LIB_DEPEND_DIR=`brew info icu4c | grep /usr/local/Cellar/icu4c | cut -d \  -f 1 | awk 'END {print}'`

echo "$LIBNAME-DIR:"
echo $LIB_DEPEND_DIR

if [ ! -f "$extFile" ]; then

	echo "$MDIR/source/php/php${VERSION}/ext/intl"
	cd $MDIR/source/php/php${VERSION}/ext/intl
	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--enable-intl  && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
