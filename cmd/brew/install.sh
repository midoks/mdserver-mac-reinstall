#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


CHECK_BREW=`which brew`
if [  "$CHECK_BREW" == "" ];then
	echo "缺少brew命令,正在安装..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}

if [ ! -d ${BREW_DIR}/Cellar/wget ];then
	brew install wget
fi

if [ ! -d ${BREW_DIR}/Cellar/openssl@1.0 ];then
	brew install rbenv/tap/openssl@1.0
fi


DEPEND_ON_1=(binutils libressl)
for DO in ${DEPEND_ON_1[@]}; do
	if [ ! -d ${BREW_DIR}/Cellar/${DO} ];then
		brew install ${DO}
	fi
done

PHP_EXT_NEED_LIST=(openssl@1.1 icu4c imagemagick curl wget libxml2 libevent oniguruma zlib libzip rabbitmq-c geoip libxdiff libcouchbase)
for PHP_EXT in ${PHP_EXT_NEED_LIST[@]}; do
	if [ ! -d ${BREW_DIR}/Cellar/${PHP_EXT} ];then
		brew install ${PHP_EXT}
	# else
	# 	brew upgrade ${PHP_EXT}
	fi
done

