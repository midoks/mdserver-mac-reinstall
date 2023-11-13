#! /bin/sh
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


VERSION=$1
LIBNAME=$2
LIBV=$3


CONFIG_OPTION=$4
CONFIG_OPTION=${CONFIG_OPTION//\|/ }

FIND_KEYWORD=$5
if [ "$FIND_KEYWORD" == "" ];then
	FIND_KEYWORD=$LIBNAME
fi

# echo "$VERSION $LIBNAME $LIBV $FIND_KEYWORD $CONFIG_OPTION"

# NON_ZTS_FILENAME=no-debug-non-zts-20121212
# if [ "$VERSION" == "56" ]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20131226
# elif [[ "$VERSION" == "70" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20151012
# elif [[ "$VERSION" == "71" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20160303
# elif [[ "$VERSION" == "72" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20170718
# elif [[ "$VERSION" == "73" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20180731
# elif [[ "$VERSION" == "74" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20190902
# elif [[ "$VERSION" == "80" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20200930
# elif [[ "$VERSION" == "81" ]]; then
# 	NON_ZTS_FILENAME=no-debug-non-zts-20201009
# else
# 	NON_ZTS_FILENAME=no-debug-non-zts-20121212
# fi

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=iconv.so" > $TMP_PHP_INI
echo "extension=$LIBNAME.so" >> $TMP_PHP_INI

$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "$FIND_KEYWORD"`

echo "install ${VERSION}|$LIBNAME start"


EXT_IS_INVAILD=`cat  $TMP_CHECK_LOG | grep "Unable to load dynamic library"`
if [ "$EXT_IS_INVAILD" != "" ]; then
	rm -rf $extFile
else
	if [ "$FIND_IS_INSTALL" != "" ]; then
		echo "install $LIBNAME end ."
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

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib

	if [ ! -f $php_lib/${LIBNAME}-${LIBV}.tgz ]; then
		wget --no-check-certificate -O $php_lib/${LIBNAME}-${LIBV}.tgz http://pecl.php.net/get/${LIBNAME}-${LIBV}.tgz
		
	fi

	if [ ! -d $php_lib/${LIBNAME}-${LIBV} ]; then
		cd $php_lib
		tar xvf ${LIBNAME}-${LIBV}.tgz
	fi

	cd $php_lib/${LIBNAME}-${LIBV}

	$DIR/php/php$VERSION/bin/phpize
	echo "./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config ${CONFIG_OPTION}"
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config ${CONFIG_OPTION}
	make clean && make && make install && make clean

	if [ -d $php_lib/${LIBNAME}-${LIBV} ];then
		rm -rf $php_lib/${LIBNAME}-${LIBV}
	fi

fi

echo "install ${VERSION}|$LIBNAME end"

