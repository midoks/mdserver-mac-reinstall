#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin



DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/php

PHP_VER=5.2.17
PHP_M_VER=52

if [ ! -f $MDIR/source/php/php-${PHP_VER}.tar.gz ]; then
	wget -O $MDIR/source/php/php-${PHP_VER}.tar.gz https://museum.php.net/php5/php-${PHP_VER}.tar.gz
fi

if [ ! -f $MDIR/source/php/php-5.2.17-fpm-0.5.14.diff.gz ]; then
	wget -O $MDIR/source/php/php-5.2.17-fpm-0.5.14.diff.gz http://php-fpm.org/downloads/php-5.2.17-fpm-0.5.14.diff.gz
fi


if [ ! -f $MDIR/source/php/php-5.2.17-max-input-vars.patch ]; then
	wget -O $MDIR/source/php/php-5.2.17-max-input-vars.patch https://raw.github.com/laruence/laruence.github.com/master/php-5.2-max-input-vars/php-5.2.17-max-input-vars.patch
fi


if [ ! -d $MDIR/source/php/php${PHP_M_VER} ]; then
	if [ ! -d $MDIR/source/php/php-${PHP_VER} ]; then
		cd $MDIR/source/php && tar -zxvf $MDIR/source/php/php-${PHP_VER}.tar.gz
	fi

	mv $MDIR/source/php/php-${PHP_VER} $MDIR/source/php/php${PHP_M_VER}
fi

cd $MDIR/source/php
gzip -cd php-5.2.17-fpm-0.5.14.diff.gz | patch -d php52 -p1
cd $MDIR/source/php/php${PHP_M_VER}
patch -p1 < ../php-5.2.17-max-input-vars.patch
sed -i '_bak' "s/\!png_check_sig (sig, 8)/png_sig_cmp (sig, 0, 8)/" ext/gd/libgd/gd_png.c 


\cp -rf $DIR/reinstall/php52/lib/node.c $MDIR/source/php/php52/ext/dom/node.c
\cp -rf $DIR/reinstall/php52/lib/documenttype.c $MDIR/source/php/php52/ext/dom/documenttype.c
\cp -rf $DIR/reinstall/php52/lib/simplexml.c $MDIR/source/php/php52/ext/simplexml/simplexml.c
\cp -rf $DIR/reinstall/php52/lib/php_xmlwriter.c $MDIR/source/php/php52/ext/xmlwriter/php_xmlwriter.c
\cp -rf $DIR/reinstall/php52/lib/reentrancy.c $MDIR/source/php/php52/main/reentrancy.c


#./configure --help
if [ ! -d $DIR/php/php${PHP_M_VER} ];then

./configure --prefix=$DIR/php/php${PHP_M_VER} \
--exec-prefix=$DIR/php/php${PHP_M_VER} \
--with-config-file-path=$DIR/php/php${PHP_M_VER}/etc \
--with-iconv=$DIR/cmd/libiconv \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm

make  && make install && make clean

fi


# if [ ! -f $DIR/php/php${PHP_M_VER}/bin/php ];then
# 	mv $DIR/php/php${PHP_M_VER}/bin/php.dSYM $DIR/php/php${PHP_M_VER}/bin/php
# fi

# if [ ! -f $DIR/php/php${PHP_M_VER}/sbin/php-fpm ];then
# 	mv $DIR/php/php${PHP_M_VER}/sbin/php-fpm.dSYM $DIR/php/php${PHP_M_VER}/sbin/php-fpm
# fi


# USER=$(who | sed -n "2,1p" |awk '{print $1}')
# SDIR=$(dirname "$DIR")

# if [ ! -f $DIR/php/php${PHP_M_VER}/php-fpm ];then
# 	cp $DIR/reinstall/tpl/php/php-fpm $DIR/php/php${PHP_M_VER}/
# 	sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/php-fpm

# 	rm -rf $DIR/php/php${PHP_M_VER}/php-fpm_bak
# fi



# if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php.ini ];then
# 	cp $DIR/reinstall/tpl/php/php.ini $DIR/php/php${PHP_M_VER}/etc/php.ini
# fi


# if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf ];then
# 	cp $DIR/reinstall/tpl/php/php-fpm.conf $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf
# 	sed -i '_bak' "s#{PATH}#${SDIR}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf
# 	sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf

# 	rm -rf $DIR/php/php${PHP_M_VER}/etc/php-fpm.conf_bak
# fi

# if [ ! -f $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf ];then
# 	mkdir -p $DIR/php/php${PHP_M_VER}/etc/php-fpm.d
# 	cp $DIR/reinstall/tpl/php/www.conf $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf
# 	sed -i '_bak' "s#{PATH}#${SDIR}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf
# 	sed -i '_bak' "s#{VERSION}#${PHP_M_VER}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf
# 	sed -i '_bak' "s#{USER}#${USER}#g" $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf

# 	rm -rf $DIR/php/php${PHP_M_VER}/etc/php-fpm.d/www.conf_bak
# fi


# if [ ! -d $DIR/php/php${PHP_M_VER}/lib/php/extensions/no-debug-non-zts-20090626 ]; then
# 	mkdir -p $DIR/php/php${PHP_M_VER}/lib/php/extensions/no-debug-non-zts-20090626
# fi


