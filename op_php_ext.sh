#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")


# PHP_VER_LIST=(53 54 55 56 70 71 72 73 74)
PHP_VER_LIST=(55 56 71 72 73 74)
for PHP_VER in ${PHP_VER_LIST[@]}; do
	 # grep $1 | cut -d \  -f 1 | awk 'END {print}'
	PHP_EXT=`ls $MDIR/php/php${PHP_VER}/lib/php/extensions/ |grep debug`
	PHP_EXT_DIR=$MDIR/php/php${PHP_VER}/lib/php/extensions/$PHP_EXT

	if [ -f $PHP_EXT_DIR/${1}.so ];then
		echo $PHP_EXT_DIR/${1}.so

		rm -rf $PHP_EXT_DIR/${1}.so
		echo "php${PHP_VER} -- deleted ok!"
	fi
done



