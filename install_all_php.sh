#! /bin/bash

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

# cd /Applications/mdserver/bin/reinstall/php54/openssl && bash install.sh 54
# cd /Applications/mdserver/bin/reinstall/php55/openssl && bash install.sh 55
# cd /Applications/mdserver/bin/reinstall/php71/openssl && bash install.sh 71
# cd /Applications/mdserver/bin/reinstall/php71/nsq && bash install.sh 71



# cd /Applications/mdserver/bin/reinstall/php56 && bash install.sh



# PHP_VER_LIST=(55 56 71 72 74 80 81 82)
PHP_VER_LIST=(72)
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

	EXT_IGNORE=(grpc zip intl oci8 sqlsrv mosquitto xdiff nsq mcrypt lua)

	for i in $dir
	do
		IS_IGNORE=''
		for EXT_IGNORE_I in ${EXT_IGNORE[@]}
		do
			if [ "$EXT_IGNORE_I" == "$i" ];then
				IS_IGNORE='ok'
				break
			fi
		done

		if [ "$IS_IGNORE" == "ok" ];then
			continue
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
