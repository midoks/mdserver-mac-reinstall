#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=amqp
LIBV=1.9.4

echo "install $LIBNAME start"

sh $MDIR/bin/reinstall/check_common.sh $VERSION

extFile=$DIR/php/php$VERSION/lib/php/extensions/no-debug-non-zts-20170718/${LIBNAME}.so

isInstall=`cat $DIR/php/php$VERSION/etc/php.ini|grep '${LIBNAME}.so'`
if [ "${isInstall}" != "" ]; then
	echo "php-$VERSION 已安装${LIBNAME},请选择其它版本!"
	return
fi


if [ ! -d /usr/local/Cellar/rabbitmq-c ];then
	brew install rabbitmq-c
fi

LIB_DEPEND_DIR=`brew info rabbitmq-c | grep /usr/local/Cellar/rabbitmq-c | cut -d \  -f 1 | awk 'END {print}'`

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
	--with-amqp \
	--with-librabbitmq-dir=$LIB_DEPEND_DIR \
	&& make && make install && make clean
fi

echo "install $LIBNAME end"
