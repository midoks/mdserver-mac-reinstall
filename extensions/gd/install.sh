#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=gd
LIBV='v'

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/$NON_ZTS_FILENAME/${LIBNAME}.so

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "GD Support"`

echo "install ${VERSION}|$LIBNAME start"

EXT_IS_INVAILD=`cat  $TMP_CHECK_LOG | grep "Unable to load dynamic library"`
if [ "$EXT_IS_INVAILD" != "" ]; then
	rm -rf $extFile
else
	if [ "$FIND_IS_INSTALL" != "" ]; then
		echo "install ${VERSION}|$LIBNAME end ."
		exit 0
	fi
fi

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG

sh $MDIR/bin/reinstall/check_common.sh $VERSION
isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ ! -f "$extFile" ]; then

	OPTIONS="--with-zlib-dir=$DIR/cmd/zlib "
	OPTIONS="$OPTIONS --with-png-dir=$DIR/cmd/libpng"
	OPTIONS="$OPTIONS --with-png-dir=$DIR/cmd/freetype"
	OPTIONS="$OPTIONS --with-png-dir=$DIR/cmd/libjpeg"


	# --enable-gd-jis-conv
	OPTIONS_GT8='--enable-gd  --with-webp --with-xpm --with-jpeg --with-freetype'


	SELECT_OPTION=$OPTIONS
	if [ "$VERSION" -gt "74" ];then
		SELECT_OPTION=$OPTIONS_GT8
	fi


	cd $MDIR/source/php/php${VERSION}/ext/gd
	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	$SELECT_OPTION
	
	make && make install
fi

echo "install ${VERSION}|$LIBNAME end"
