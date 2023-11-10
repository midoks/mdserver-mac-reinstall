#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

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
# https://downloads.ioncube.com/loader_downloads/ioncube_loaders_dar_arm64.zip
IONCUBE_SUFFIX=.zip
IONCUBE_NAME_PREFIX=ioncube_loaders_mac
IONCUBE_NAME=ioncube_loaders_mac_x86-64
if [ "${SYS_ARCH}" == "arm64" ];then
	IONCUBE_NAME_PREFIX=ioncube_loaders_dar
	IONCUBE_NAME=ioncube_loaders_dar_arm64
fi

if [ ! -f "$extFile" ]; then

	MIN_VER="${VERSION:0:1}.${VERSION:1:2}"

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib

	if [ ! -f $php_lib/${IONCUBE_NAME}.${IONCUBE_SUFFIX} ]; then
		wget -O $php_lib/${IONCUBE_NAME}.${IONCUBE_SUFFIX} https://downloads.ioncube.com/loader_downloads/${IONCUBE_NAME}.${IONCUBE_SUFFIX}
	fi

	if [ ! -d $php_lib/ioncube ]; then
		cd $php_lib && unzip ${IONCUBE_NAME}.${IONCUBE_SUFFIX}
	fi

	cp -rf $php_lib/ioncube/${IONCUBE_NAME_PREFIX}_${MIN_VER}.so $extFile
	xattr -c  $extFile

fi
echo "install $LIBNAME end"
