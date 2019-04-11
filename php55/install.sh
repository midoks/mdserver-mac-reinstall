#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin



DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/php

PHP_VER=5.5.38
PHP_M_VER=55

if [ ! -f $MDIR/source/php/php-${PHP_VER}.tar.xz ];then
	wget -O $MDIR/source/php/php-${PHP_VER}.tar.xz https://museum.php.net/php5/php-${PHP_VER}.tar.xz
fi

if [ ! -d $MDIR/source/php/php-${PHP_VER} ];then
	cd $MDIR/source/php && tar -Jxf $MDIR/source/php/php-${PHP_VER}.tar.xz
fi

echo $DIR
if [ ! -d $MDIR/source/php/php${PHP_M_VER} ]; then
	mv $MDIR/source/php/php-${PHP_VER} $MDIR/source/php/php${PHP_M_VER}
	cd $MDIR/source/php/php${PHP_M_VER}
fi


#./configure --help
if [ ! -d $DIR/php/php${PHP_M_VER} ];then

./configure \
--prefix=$DIR/php/php${PHP_M_VER} \
--exec-prefix=$DIR/php/php${PHP_M_VER} \
--with-config-file-path=$DIR/php/php${PHP_M_VER}/etc \
--with-mysql=mysqlnd \
--with-mysql-sock=/tmp/mysql.sock \
--enable-embedded-mysqli \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--without-iconv \
--with-zlib-dir=$DIR/cmd/zlib \
--with-mhash=$DIR/cmd/mhash \
--enable-zip \
--enable-mbstring \
--enable-opcache \
--enable-ftp \
--enable-wddx \
--enable-soap \
--enable-posix \
--enable-sockets \
--enable-fpm

#--enable-dtrace \
#--enable-debug

#--with-iconv=$DIR/cmd/libiconv \
#--with-zlib-dir=$DIR/cmd/zlib \

make && make install && make clean

fi


USER=$(who | sed -n "2,1p" |awk '{print $1}')
SDIR=$(dirname "$DIR")

if [ ! -f $DIR/php/php${PHP_M_VER}/php-fpm ];then
	cp $DIR/reinstall/tpl/php/php-fpm $DIR/php/php${PHP_M_VER}/
	sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/php-fpm

	rm -rf $DIR/php/php${PHP_M_VER}/php-fpm_bak
fi



if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php.ini ];then
	cp $DIR/reinstall/tpl/php/php.ini $DIR/php/php${PHP_M_VER}/etc/php.ini
fi


if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf ];then
	cp $DIR/reinstall/tpl/php/php-fpm.conf $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf
	sed -i '_bak' "s#{PATH}#${SDIR}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf
	sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf

	rm -rf $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf_bak
fi

if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf ];then
	mkdir -p $DIR/php/php${PHP_M_VER}/etc/php-fpm.d
	cp $DIR/reinstall/tpl/php/www.conf $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf
	sed -i '_bak' "s#{PATH}#${SDIR}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf
	sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf
	sed -i '_bak' "s#{USER}#${USER}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf

	rm -rf $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf_bak
fi

