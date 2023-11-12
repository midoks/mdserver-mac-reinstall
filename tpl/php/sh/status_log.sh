#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")
PATH=$PATH:$DIR/mysql/bin
PHP_VERSION=$1

function checkPHPStart(){
	echo "checkPHP start"
	if [ -f /tmp/php$PHP_VERSION-cgi.sock ];then
		rm -rf /tmp/php$PHP_VERSION-cgi.sock
	fi
}

function checkPHPStop(){
	echo "checkPHP stop"
	if [ -f /tmp/php$PHP_VERSION-cgi.sock ];then
		rm -rf /tmp/php$PHP_VERSION-cgi.sock
	fi
}

function startPHP(){
	$DIR/php/php$PHP_VERSION/php-fpm start
}

function stopPHP(){
	FIND_ISRUN=`ps -ef|grep php$PHP_VERSION |grep -v grep`
	if [ "$FIND_ISRUN" != "" ];then
		$DIR/php/php$PHP_VERSION/php-fpm stop
	fi

	ps -ef|grep php$PHP_VERSION | grep -v grep | awk '{print $2}'|xargs kill


	/bin/rm -rf $DIR/tmp/xhprof/*.xhprof
	/bin/rm -rf $DIR/tmp/xdebug/*
	/bin/rm -rf $DIR/tmp/session/sess_*
	/bin/rm -rf $DIR/tmp/logs/*
}

function stopAllPHP(){

	PHP_VER_LIST=(55 56 71 72 73 74 80 81 82 83)
	for PHP_VER in ${PHP_VER_LIST[@]}; do
		if [ -f $DIR/php/php$PHP_VER/php-fpm ];then
			continue
		fi
		isStop=`$DIR/php/php$PHP_VER/php-fpm status | grep 'stopped'`
		if [ "$isStop" == "" ];then
			echo "$DIR/php/php$PHP_VER/php-fpm stop"
			$DIR/php/php$PHP_VER/php-fpm stop
		fi 
	done

	ps -ef|grep php | grep -v grep | awk '{print $2}'|xargs kill

	/bin/rm -rf $DIR/tmp/xhprof/*.xhprof
	/bin/rm -rf $DIR/tmp/xdebug/*
	/bin/rm -rf $DIR/tmp/session/sess_*
	/bin/rm -rf $DIR/tmp/logs/*
}

function reloadPHP(){
	$DIR/php/php$PHP_VERSION/php-fpm reload
	
	/bin/rm -rf $DIR/tmp/xhprof/*.xhprof
	/bin/rm -rf $DIR/tmp/xdebug/*
	/bin/rm -rf $DIR/tmp/session/sess_*
	/bin/rm -rf $DIR/tmp/logs/*
}

if [ $2 = "start" ];then 
	checkPHPStart
	startPHP
fi

if [ $2 = "stop" ];then 
	stopAllPHP
	checkPHPStop
fi

if [ $2 = "stopone" ];then 
	stopPHP
	checkPHPStop
fi

if [ $2 = "reload" ];then 
	reloadPHP
fi