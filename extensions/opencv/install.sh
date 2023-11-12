#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

exit 0

if [ ! -d /usr/local/Cellar/opencv ];then
	brew install opencv
fi

export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"

export LDFLAGS="-L/usr/local/opt/opencv@2/lib"
export CPPFLAGS="-I/usr/local/opt/opencv@2/include"
export PKG_CONFIG_PATH="/usr/local/opt/opencv@2/lib/pkgconfig"

VERSION=$1
LIBNAME=php-opencv
LIBV=3.3.0

#check
TMP_PHP_INI=/tmp/t_tmp_php.ini
TMP_CHECK_LOG=/tmp/t_check_php.log

echo "extension=opencv.so" > $TMP_PHP_INI
$DIR/php/php$VERSION/bin/php -c $TMP_PHP_INI -r 'phpinfo();' > $TMP_CHECK_LOG
FIND_IS_INSTALL=`cat  $TMP_CHECK_LOG | grep "opencv support"`

echo "install $LIBNAME start"

rm -rf $TMP_PHP_INI
rm -rf $TMP_CHECK_LOG
if [ "$FIND_IS_INSTALL" != "" ]; then
	echo "install $LIBNAME end"	
	exit 0
fi

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20160303/${LIBNAME}.so


isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ -f  $extFile ]; then
	rm -rf $extFile
fi


if [ ! -d /usr/local/Cellar/opencv@3 ];then
	brew install opencv@3
fi

# LIB_DEPEND_DIR=`brew info opencv@3 | grep /usr/local/Cellar/opencv@3 | cut -d \  -f 1 | awk 'END {print}'`
# echo "$LIBNAME-DIR:"
# echo $LIB_DEPEND_DIR
brew unlink opencv
brew link opencv@3 --force

if [ ! -f "$extFile" ]; then

	php_lib=$MDIR/source/php_lib
	mkdir -p $php_lib

	if [ ! -f $php_lib/${LIBNAME}-${LIBV}.tgz ]; then
		wget -O $php_lib/${LIBNAME}-${LIBV}.tgz https://github.com/hihozhou/php-opencv/archive/3.3.0.tar.gz
		
	fi
	cd $php_lib/${LIBNAME}-${LIBV}

	if [ ! -d $php_lib/${LIBNAME}-${LIBV} ]; then
		cd $php_lib
		tar xvf ${LIBNAME}-${LIBV}.tgz
	fi

	cd $php_lib/${LIBNAME}-${LIBV}

	#echo 'export PATH="/usr/local/opt/opencv@3/bin:$PATH"' >> ~/.bash_profile
	export LDFLAGS="-L/usr/local/opt/opencv@3/lib"
  	export CPPFLAGS="-I/usr/local/opt/opencv@3/include"
	export PKG_CONFIG_PATH="/usr/local/opt/opencv@3/lib/pkgconfig"

	$DIR/php/php$VERSION/bin/phpize
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	 --with-opencv && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
