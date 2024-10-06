#! /bin/sh
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=zip
LIBV=1.22.4

if [ "$VERSION" -lt "70" ];then
	LIBV=1.21.1
fi

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so


#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.output_dir"`

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


BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}
LIB_DEPEND_DIR=`brew info libzip | grep ${BREW_DIR}/Cellar/libzip | cut -d \  -f 1 | awk 'END {print}'`
# PCRE_DEPEND_DIR=`brew info pcre | grep ${BREW_DIR}/Cellar/pcre | cut -d \  -f 1 | awk 'END {print}'`
# export PKG_CONFIG_PATH=$LIB_DEPEND_DIR/lib/pkgconfig:${PCRE_DEPEND_DIR}/lib/pkgconfig

# LIB_CONFIG_PATH=$LIB_DEPEND_DIR/lib/pkgconfig:${PCRE_DEPEND_DIR}/lib/pkgconfig

# echo $PKG_CONFIG_PATH

# exit 0



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

	$DIR/php/php$VERSION/bin/phpize
	./configure --enable-zip \
	--with-libzip=$LIB_DEPEND_DIR \
	--with-php-config=$DIR/php/php$VERSION/bin/php-config  \
	&& make && make install && make clean
fi

echo "install ${VERSION}|$LIBNAME end"
