#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/php

PHP_VER=7.1.33
PHP_M_VER=71

if [ ! -f $MDIR/source/php/php-${PHP_VER}.tar.xz ];then
	# wget -O $MDIR/source/php/php-${PHP_VER}.tar.xz https://www.php.net/distributions/php-${PHP_VER}.tar.xz
	wget -O $MDIR/source/php/php-${PHP_VER}.tar.xz https://mirrors.sohu.com/php/php-${PHP_VER}.tar.xz
fi


if [ ! -d $MDIR/source/php/php${PHP_M_VER} ]; then
	if [ ! -d $MDIR/source/php/php-${PHP_VER} ];then
		cd $MDIR/source/php && tar -Jxf $MDIR/source/php/php-${PHP_VER}.tar.xz
	fi

	mv $MDIR/source/php/php-${PHP_VER} $MDIR/source/php/php${PHP_M_VER}
	cd $MDIR/source/php/php${PHP_M_VER}
fi

#./configure --help
if [ ! -d $DIR/php/php${PHP_M_VER} ];then
cd $MDIR/source/php/php${PHP_M_VER}

cat $MDIR/bin/reinstall/tpl/php/php7/reentrancy.c > $MDIR/source/php/php${PHP_M_VER}/main/reentrancy.c
cat $MDIR/bin/reinstall/tpl/php/php7/mkstemp.c > $MDIR/source/php/php${PHP_M_VER}/ext/zip/lib/mkstemp.c
cat $MDIR/bin/reinstall/tpl/php/php7/ext/pcre/sljitConfigInternal.h > $MDIR/source/php/php${PHP_M_VER}/ext/pcre/pcrelib/sljit/sljitConfigInternal.h

./configure \
--prefix=$DIR/php/php${PHP_M_VER} \
--exec-prefix=$DIR/php/php${PHP_M_VER} \
--with-config-file-path=$DIR/php/php${PHP_M_VER}/etc \
--with-mysql-sock=/tmp/mysql.sock \
--enable-mysqlnd \
--enable-embedded-mysqli \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-zlib-dir=$DIR/cmd/zlib \
--with-mhash=$DIR/cmd/mhash \
--without-iconv \
--enable-mbstring \
--enable-opcache \
--enable-ftp \
--enable-wddx \
--enable-soap \
--enable-sockets \
--enable-simplexml \
--enable-posix \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--disable-zip \
--disable-fileinfo \
--enable-fpm

#--enable-dtrace \
#--enable-debug

make -j4 && make install && make clean

fi

if [ "$?" != "0" ];then
	echo "install fail!!"
	exit 2
fi


if [ ! -f $DIR/php/php${PHP_M_VER}/php-fpm ];then
	cp $DIR/reinstall/tpl/php/php-fpm $DIR/php/php${PHP_M_VER}/
fi


if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php.ini ]; then
	cp $DIR/reinstall/tpl/php/php.ini $DIR/php/php${PHP_M_VER}/etc/php.ini
fi


USER=$(who | sed -n "2,1p" |awk '{print $1}')
SDIR=$(dirname "$DIR")

if [ ! -f "$DIR/php/php${PHP_M_VER}/php-fpm" ]; then
	cp $DIR/reinstall/tpl/php/php-fpm $DIR/php/php${PHP_M_VER}	
fi

sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/php-fpm
rm -rf $DIR/php/php${PHP_M_VER}/php-fpm_bak


if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php.ini ]; then
	cp $DIR/reinstall/tpl/php/php.ini $DIR/php/php${PHP_M_VER}/etc/php.ini
fi


if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf ]; then
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


