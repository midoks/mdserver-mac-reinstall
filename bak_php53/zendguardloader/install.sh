#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=ZendGuardLoader
LIBV='0'
PHP_VERSION=5.2

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "zend_extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.loader.encoded_paths"`


echo "install $LIBNAME start"

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG
if [ "$FIND_IS_INSTALL" != "" ]; then
	echo "install $LIBNAME end"
	exit 0
fi


sh $MDIR/bin/reinstall/check_common.sh $VERSION

extDir=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20060613
extFile=$extDir/${LIBNAME}.so

if [ -f  $extFile ]; then
	rm -rf $extFile
fi

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ ! -f "$extFile" ]; then

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib

	if [ ! -f $php_lib/ZendGuardLoader-php-5.3-darwin-i386.tar.gz ]; then
		wget -O $php_lib/ZendGuardLoader-php-5.3-darwin-i386.tar.gz http://downloads.zend.com/guard/5.5.0/ZendGuardLoader-php-5.3-darwin-i386.tar.gz
		
	fi


	if [ ! -d $php_lib/${LIBNAME}-${LIBV} ]; then
		cd $php_lib
		tar zxvf ZendGuardLoader-php-5.3-darwin-i386.tar.gz
	fi

	cd $php_lib/ZendGuardLoader-php-5.3-darwin-i386
	cp $php_lib/ZendGuardLoader-php-5.3-darwin-i386/php-5.3.x/ZendGuardLoader.so $extDir/ZendGuardLoader.so
fi

echo "install $LIBNAME end"
