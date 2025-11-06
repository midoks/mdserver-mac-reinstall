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
# cd /Applications/mdserver/bin/reinstall/extensions/openssl && bash install.sh 80
# cd /Applications/mdserver/bin/reinstall/extensions/nsq && bash install.sh 71
# cd /Applications/mdserver/bin/reinstall/extensions/curl && bash install.sh 84

# cd /Applications/mdserver/bin/reinstall/php73 && bash install.sh
# cd /Applications/mdserver/bin/reinstall/php81 && bash install.sh

# 安装，开启后无法使用
# xhprof mongodb 

PHP_VER_LIST=(55 56 71 72 73 74 81 82 83 84 85)
# PHP_VER_LIST=(84)
PHP_EXT_LIST=(curl pcntl mcrypt fileinfo \
	exif gd gettext zlib zip intl openssl memcache memcached redis imagick swoole yaf iconv)

# PHP_VER_LIST=(83)

# for PHP_VER in ${PHP_VER_LIST[@]}
# do
# 	# test version all ext
# 	test_ext=grpc
# 	# cd $DIR/extensions/$test_ext && bash uninstall.sh $PHP_VER
# 	cd $DIR/extensions/${test_ext} && bash install.sh ${PHP_VER}
# done


for PHP_VER in ${PHP_VER_LIST[@]}
do
	echo "php${PHP_VER} -- start"
	cd $DIR/php$PHP_VER && sh install.sh

	if [ ! -f $MDIR/php/php$PHP_VER/bin/phpize ];then
		echo "$PHP_VER compilation failed"
		continue;
	fi

	ext_all=$(ls -l $DIR/extensions |awk '/^d/ {print $NF}')
	for i in $ext_all
	do

		if [ "$i" == "grpc" ];then
			continue
		fi


		find_support=$(cat ${DIR}/extensions/lib.md |grep $i | awk -F '|' '{print $2}')
		if [ "$find_support" = "" ];then
			continue
		fi
		find_support_php=$(echo $find_support |grep $PHP_VER)
		if [ "$find_support_php" != "" ];then
			# echo "cd $DIR/extensions/$i && sh install.sh $PHP_VER"
			cd $DIR/extensions/$i && sh install.sh $PHP_VER
		fi
	done

	for PHP_EXT in ${PHP_EXT_LIST[@]}
	do
		find_support=$(cat ${DIR}/extensions/lib.md |grep $PHP_EXT | awk -F '|' '{print $2}')
		find_support_php=$(echo $find_support |grep $PHP_VER)
		if [ "$find_support_php" != "" ];then
			echo "php${PHP_VER} - ${PHP_EXT} -- load start"
			if [ -d $DIR/extensions/$PHP_EXT ];then
				cd $DIR/extensions/$PHP_EXT && sh unload.sh $PHP_VER
				cd $DIR/extensions/$PHP_EXT && sh load.sh $PHP_VER
			fi
			echo "php${PHP_VER} - ${PHP_EXT} -- load end"
		fi

	done
	echo "php${PHP_VER} -- end"
done

