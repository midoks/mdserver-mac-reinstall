#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin



DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/php

PHP_VER=5.4.45
PHP_M_VER=54

if [ ! -f $MDIR/source/php/php-${PHP_VER}.tar.bz2 ];then
	wget -O $MDIR/source/php/php-${PHP_VER}.tar.bz2 https://museum.php.net/php5/php-${PHP_VER}.tar.bz2
fi



if [ ! -d $MDIR/source/php/php${PHP_M_VER} ]; then
	if [ ! -d $MDIR/source/php/php-${PHP_VER} ];then
		cd $MDIR/source/php && tar -Jxf $MDIR/source/php/php-${PHP_VER}.tar.bz2

		mv $MDIR/source/php/php-${PHP_VER} $MDIR/source/php/php${PHP_M_VER}
		cd $MDIR/source/php/php${PHP_M_VER}
	fi
	
fi


cd $MDIR/source/php/php${PHP_M_VER}
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
--with-zlib-dir=$DIR/cmd/zlib \
--with-mhash=$DIR/cmd/mhash \
--without-iconv \
--enable-zip \
--enable-ftp \
--enable-wddx \
--enable-soap \
--enable-posix \
--enable-simplexml \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--enable-fpm

\cp -rf $DIR/reinstall/php54/lib/reentrancy.c $MDIR/source/php/php54/main/reentrancy.c

#--enable-mbstring \
#--enable-dtrace \
#--enable-debug
#--with-iconv=$DIR/cmd/libiconv \
#--with-zlib-dir=$DIR/cmd/zlib \

make && make install && make clean

fi

if [ "$?" != "0" ];then
	#rm -rf $MDIR/source/php/php${PHP_M_VER}
	echo "install fail!!"
	exit 2
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


if [ ! -d $DIR/php/php${PHP_M_VER}/lib/php/extensions/no-debug-non-zts-20100525 ]; then
	mkdir -p $DIR/php/php${PHP_M_VER}/lib/php/extensions/no-debug-non-zts-20100525
fi




