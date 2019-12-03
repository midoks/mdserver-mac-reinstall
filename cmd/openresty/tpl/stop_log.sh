#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)


function stopNginx(){
	kill -QUIT `cat /Applications/mdserver/bin/tmp/nginx.pid`
	#$DIR/openresty/nginx/sbin/nginx -s stop
	pkill nginx
	echo "" > $DIR/openresty/nginx/logs/access.log
	echo "" > $DIR/openresty/nginx/logs/error.log
	rm -rf $DIR/openresty/nginx/client_body_temp
	rm -rf $DIR/openresty/nginx/fastcgi_temp
	rm -rf $DIR/openresty/nginx/proxy_temp
	rm -rf $DIR/openresty/nginx/scgi_temp
	rm -rf $DIR/openresty/nginx/uwsgi_temp


	PHP_LIST=("53" "54" "55" "56" "70" "71" "72" "73" "74")

	for i in ${PHP_LIST[*]}
	do
		FIND_ISRUN=`ps -ef|grep php${i} |grep -v grep`
		if [ "$FIND_ISRUN" != "" ];then
			$DIR/php/php${i}/php-fpm stop
		fi
		
	done

	rm -rf $DIR/tmp/xhprof/*.xhprof
	rm -rf $DIR/tmp/xdebug/*
	rm -rf $DIR/tmp/session/sess_*
	rm -rf $DIR/tmp/logs/*
}

function checkNginx(){
	echo "checkNginx"
	if [ -f $DIR/tmp/nginx.pid ];then
		rm -rf $DIR/tmp/nginx.pid
	fi
}

function stopMySQL(){
	$DIR/mysql/bin/mysqladmin -uroot -proot shutdown
	if [ -f $DIR/tmp/nginx.pid ];then
		pkill mysql
		rm -rf $DIR/mysql/data/mysql.pid
	fi
}

if [ $1 = "nginx" ];then
	stopNginx
	checkNginx
fi

if [ $1 = "mysql" ];then
	stopMySQL
fi