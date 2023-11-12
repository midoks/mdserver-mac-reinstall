#!/bin/bash

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")


# cd /Applications/mdserver/bin/reinstall && bash install_all_php.sh


# cd /Applications/mdserver/bin/reinstall/cmd/base && bash install.sh
# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_pcre.sh
# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_zlib.sh
# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_gettext.sh
# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_openssl.sh
# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_libmcrypt.sh



# cd /Applications/mdserver/bin/reinstall/extensions/mbstring && bash install.sh 55
# cd /Applications/mdserver/bin/reinstall/extensions/grpc && bash install.sh 82
# cd /Applications/mdserver/bin/reinstall/extensions/openssl && bash install.sh 71
# cd /Applications/mdserver/bin/reinstall/extensions/nsq && bash install.sh 71

# cd /Applications/mdserver/bin/reinstall/php56 && bash install.sh


PHP_VER_LIST=(55 56 71 72 74 80 81 82)
PHP_EXT_LIST=(curl openssl pcntl mcrypt fileinfo \
	exif gd gettext zlib intl memcache memcached redis imagick xhprof swoole yaf mongodb iconv)

# PHP_VER_LIST=(82)
# PHP_EXT_LIST=(xdiff)

for PHP_VER in ${PHP_VER_LIST[@]}
do
	echo "php${PHP_VER} -- start"
	cd $DIR/php$PHP_VER && sh install.sh

	if [ ! -f $MDIR/php/php$PHP_VER/bin/phpize ];then
		echo "$PHP_VER compilation failed"
		continue;
	fi

	ext_all=$(ls -l $DIR/extensions |awk '/^d/ {print $NF}')
	# ext_lib=$(cat -n $DIR/extensions/lib.md)
	# echo $ext_lib

	for i in $ext_all
	do
		find_support=$(cat ${DIR}/extensions/lib.md |grep $i | awk -F '|' '{print $2}')
		if [ "$find_support" = "" ];then
			continue
		fi
		find_support_php=$(echo $find_support |grep $PHP_VER)
		if [ "$find_support_php" != "" ];then
			cd $DIR/extensions/$i && sh install.sh $PHP_VER
		fi
	done

	# for PHP_EXT in ${PHP_EXT_LIST[@]}
	# do
	# 	find_support=$(cat ${DIR}/extensions/lib.md |grep $PHP_EXT | awk -F '|' '{print $2}')
	# 	find_support_php=$(echo $find_support |grep $PHP_VER)
	# 	if [ "$find_support_php" != "" ];then
	# 		echo "php${PHP_VER} - ${PHP_EXT} -- load start"
	# 		if [ -d $DIR/extensions/$PHP_EXT ];then
	# 			cd $DIR/extensions/$PHP_EXT && sh unload.sh $PHP_VER
	# 			cd $DIR/extensions/$PHP_EXT && sh load.sh $PHP_VER
	# 		fi
	# 		echo "php${PHP_VER} - ${PHP_EXT} -- load end"
	# 	fi

	# done
	echo "php${PHP_VER} -- end"
done
