#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")
SYS_ARCH=`arch`

VERSION=$1
LIBNAME=ioncube
LIBV='0'

NON_ZTS_FILENAME=`ls $DIR/php/php$VERSION/lib/php/extensions | grep no-debug-non-zts`
extFile=$DIR/php/php$VERSION/lib/php/extensions/${NON_ZTS_FILENAME}/${LIBNAME}.so

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=$LIBNAME.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG 2>&1
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "${LIBNAME}.scale"`

echo "install $LIBNAME start"

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

# https://downloads.ioncube.com/loader_downloads/ioncube_loaders_mac_x86-64.zip
if [ ! -f "$extFile" ]; then

	MIN_VER="${VERSION:0:1}.${VERSION:1:2}"

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib


	if [ "$SYS_ARCH" == "arm64" ];then
		if [ ! -f $php_lib/ioncube_loaders_dar_arm64.tar.gz ]; then
			wget -O $php_lib/ioncube_loaders_dar_arm64.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_dar_arm64.tar.gz
		fi

		echo "cd $php_lib && tar -zxvf ioncube_loaders_dar_arm64.tar.gz"
		if [ ! -d $php_lib/ioncube ]; then
			cd $php_lib && tar -zxvf ioncube_loaders_dar_arm64.tar.gz
		fi

		if [ -f $extFile ];then
			echo "install $LIBNAME end ."
			exit 0
		fi

		if [ -f $php_lib/ioncube/ioncube_loader_dar_${MIN_VER}.so ];then
			cp -rf $php_lib/ioncube/ioncube_loader_dar_${MIN_VER}.so $extFile
			echo "cp -rf $php_lib/ioncube/ioncube_loader_dar_${MIN_VER}.so $extFile"
			xattr -c  $extFile
		fi



	else
		if [ ! -f $php_lib/ioncube_loaders_mac_x86-64.zip ]; then
			wget -O $php_lib/ioncube_loaders_mac_x86-64.zip https://downloads.ioncube.com/loader_downloads/ioncube_loaders_mac_x86-64.zip
		fi

		if [ ! -d $php_lib/ioncube ]; then
			cd $php_lib && unzip ioncube_loaders_mac_x86-64.zip 
		fi

		if [ -f $php_lib/ioncube/ioncube_loader_mac_${MIN_VER}.so ];then
			cp -rf $php_lib/ioncube/ioncube_loader_mac_${MIN_VER}.so $extFile
			xattr -c  $extFile
		fi
		
	fi

fi
echo "install $LIBNAME end"
