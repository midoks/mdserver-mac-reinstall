#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=yar
LIBV='1.2.5'


if [ "$VERSION" = "70" ] || [ "$VERSION" = "71" ] || [ "$VERSION" = "72" ] || [ "$VERSION" = "73" ]; then
	LIBV='2.0.5'
fi


#check
echo "extension=$LIBNAME.so" > /tmp/t_php_conf.ini
FIND_IS_INSTALL=$($DIR/php/php$VERSION/bin/php -c /tmp/t_php_conf.ini -r 'phpinfo();' |grep $LIBNAME | grep Reason)

echo "install $LIBNAME start"

if [ "$FIND_IS_INSTALL" == "" ]; then
	echo "install $LIBNAME end"
	exit 0
fi
rm -rf /tmp/t_php_conf.ini

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20151012/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi

if [ -f  $extFile ]; then
	rm -rf $extFile
fi

LIB_DEPEND_DIR=`brew info curl | grep /usr/local/Cellar/curl | cut -d \  -f 1`

echo "$LIBNAME-DIR:"
echo $LIB_DEPEND_DIR

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
	./configure --with-php-config=$DIR/php/php$VERSION/bin/php-config \
	--with-curl=$LIB_DEPEND_DIR && \
	make && make install && make clean
fi

echo "install $LIBNAME end"
