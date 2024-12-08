#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=openssl
LIBV='0'
BREW_OPENSSL=openssl@3

if [ "$VERSION" -lt "70" ];then
	BREW_OPENSSL=openssl@1.0
fi

# if [ "$VERSION" == "81" ];then
# 	echo "install ${VERSION}|$LIBNAME no need"
# 	exit 0
# fi

# if [ "$VERSION" -le "70" ];then
# 	if [ ! -d $DIR/cmd/openssl ];then
# 		cd $MDIR/bin/reinstall/cmd/base && sh cmd_openssl.sh
# 	fi
# fi

if [ "$VERSION" -gt "70" ];then
	if [ ! -d $DIR/cmd/openssl11 ];then
		cd $MDIR/bin/reinstall/cmd/base && sh cmd_openssl11.sh
	fi
fi


# export LDFLAGS="-L/Applications/mdserver/bin/cmd/openssl11/lib"
# export CPPFLAGS="-I/Applications/mdserver/bin/cmd/openssl11/include"

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php${VERSION}/lib/php/extensions/$NON_ZTS_FILENAME/${LIBNAME}.so

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
echo "echo "extension=$LIBNAME.so" > $TMP_PHP_INI"
echo "$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1"
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.cafile"`


echo "install ${VERSION}|$LIBNAME start"

EXT_IS_INVAILD=`cat $TMP_CHECK_LOG | grep "Unable to load dynamic library"`
if [ "$EXT_IS_INVAILD" != "" ]; then
	rm -rf $extFile
	# echo $extFile
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
	cd $MDIR/source/php/php$VERSION/ext/openssl

	if [ ! -f $MDIR/source/php/php$VERSION/ext/openssl/config.m4 ]; then
		mv $MDIR/source/php/php$VERSION/ext/openssl/config0.m4 $MDIR/source/php/php$VERSION/ext/openssl/config.m4
	fi

	LIB_DEPEND_DIR=$DIR/cmd/openssl332

	# BREW_DIR=`which brew`
	# BREW_DIR=${BREW_DIR/\/bin\/brew/}
	# brew info openssl@1.1 | grep /opt/homebrew/Cellar/openssl@1.1 | cut -d \  -f 1 | awk 'END {print}'
	# LIB_DEPEND_DIR=`brew info ${BREW_OPENSSL} | grep ${BREW_DIR}/Cellar/${BREW_OPENSSL} | cut -d \  -f 1 | awk 'END {print}'`
	echo "LIB_DEPEND_DIR:"$LIB_DEPEND_DIR
	if [ "$VERSION" -lt "84" ];then
		echo "------"
		LIB_DEPEND_DIR=$DIR/cmd/openssl11
	else
		LIB_DEPEND_DIR=$DIR/cmd/openssl332
		echo "------"
	fi

	export PKG_CONFIG_PATH=$LIB_DEPEND_DIR/lib/pkgconfig
	export OPENSSL_CFLAGS="-I${LIB_DEPEND_DIR}/include"
	export OPENSSL_LIBS="-L/${LIB_DEPEND_DIR}/lib -lssl -lcrypto -lz"
	
	$DIR/php/php$VERSION/bin/phpize
	./configure  --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-openssl=${LIB_DEPEND_DIR}
	make clean && make && make install && make clean
fi

echo "install ${VERSION}|$LIBNAME end"
