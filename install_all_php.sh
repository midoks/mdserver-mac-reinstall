#! /bin/bash

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")

CHECK_BREW=`which brew`
if [  "$CHECK_BREW" == "" ];then
	echo "缺少brew命令,正在安装..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

PHP_EXT_NEED_LIST=(openssl@1.1 icu4c imagemagick curl wget libxml2 libevent oniguruma zlib libzip rabbitmq-c geoip)
for PHP_EXT in ${PHP_EXT_NEED_LIST[@]}; do
	if [ ! -d /usr/local/Cellar/${PHP_EXT} ];then
		brew install ${PHP_EXT}
	else
		brew upgrade ${PHP_EXT}
	fi
done



PHP_VER_LIST=(55 56 71 72 73 74 80 81 82)
# PHP_VER_LIST=(71)
PHP_EXT_LIST=(curl openssl pcntl mcrypt fileinfo \
	exif gd gettext zlib intl memcache memcached redis imagick xhprof swoole yaf mongodb iconv)
for PHP_VER in ${PHP_VER_LIST[@]}
do
	echo "php${PHP_VER} -- start"
	cd $DIR/php$PHP_VER && sh install.sh

	if [ ! -f $MDIR/php/php$PHP_VER/bin/phpize ];then
		echo "$PHP_VER compilation failed"
		continue;
	fi

	dir=$(ls -l $DIR/php$PHP_VER |awk '/^d/ {print $NF}')
	for i in $dir
	do
		if [ "grpc" == "$i" ];then
			continue;
		fi

		if [ "zip" == "$i" ];then
			continue;
		fi

		if [ "intl" == "$i" ];then
			continue;
		fi

		cd $DIR/php$PHP_VER/$i && sh install.sh $PHP_VER
	done

	for PHP_EXT in ${PHP_EXT_LIST[@]}
	do
		echo "php${PHP_VER} - ${PHP_EXT} -- load start"
		if [ -d $DIR/php$PHP_VER/$PHP_EXT ];then
			cd $DIR/php$PHP_VER/$PHP_EXT && sh unload.sh $PHP_VER
			cd $DIR/php$PHP_VER/$PHP_EXT && sh load.sh $PHP_VER
		fi
		echo "php${PHP_VER} - ${PHP_EXT} -- load end"
	done
	echo "php${PHP_VER} -- end"
done
