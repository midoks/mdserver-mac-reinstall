#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


VERSION=$1
LIBNAME=zip
LIBV=0

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG  2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "Zip version"`

echo "install $LIBNAME start"

EXT_IS_INVAILD=`cat  $TMP_CHECK_LOG | grep "Unable to load dynamic library"`
if [ "$EXT_IS_INVAILD" != "" ]; then
	rm -rf $extFile
fi

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG
if [ "$FIND_IS_INSTALL" != "" ]; then
	echo "install $LIBNAME end."
	exit 0
fi

sh $MDIR/bin/reinstall/check_common.sh $VERSION


NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/$NON_ZTS_FILENAME/${LIBNAME}.so


isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi



LIB_DEPEND_DIR=`brew info libzip | grep /usr/local/Cellar/libzip | cut -d \  -f 1 | awk 'END {print}'`

echo $LIB_DEPEND_DIR

brew unlink libzip && brew link libzip

if [ ! -f "$extFile" ]; then
	
	export PKG_CONFIG_PATH="/www/server/lib/libzip/lib/pkgconfig/"

	cd $MDIR/source/php/php${VERSION}/ext/zip
	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-zip  && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
