#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=intl
LIBV=0


BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}
if [ "$VERSION" -lt "74" ];then
	LIB_DEPEND_DIR=`brew info icu4c@55.2 | grep ${BREW_DIR}/Cellar/icu4c@55.2 | cut -d \  -f 1 | awk 'END {print}'`
else
	# LIB_DEPEND_DIR=`brew info icu4c | grep ${BREW_DIR}/Cellar/icu4c | cut -d \  -f 1 | awk 'END {print}'`
	LIB_DEPEND_DIR=`brew info icu4c@75 | grep ${BREW_DIR}/Cellar/icu4c@75  | cut -d \  -f 1 | awk 'END {print}'`
fi

#must 
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${LIB_DEPEND_DIR}/lib/pkgconfig

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/$NON_ZTS_FILENAME/${LIBNAME}.so

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.default_locale"`


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

	cd $MDIR/source/php/php${VERSION}/ext/intl
	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--enable-intl && \
	make && make install && make clean
fi

echo "install ${VERSION}|$LIBNAME end"
