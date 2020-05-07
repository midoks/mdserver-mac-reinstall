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
	echo "$DIR/php/php$PHP_VERSION/php-fpm stop"
	FIND_ISRUN=`ps -ef|grep php$PHP_VERSION |grep -v grep`
	echo $FIND_ISRUN
	if [ "$FIND_ISRUN" != "" ];then
		$DIR/php/php$PHP_VERSION/php-fpm stop
	fi
	
	/bin/rm -rf $DIR/tmp/xhprof/*.xhprof
	/bin/rm -rf $DIR/tmp/xdebug/*
	/bin/rm -rf $DIR/tmp/session/sess_*
	/bin/rm -rf $DIR/tmp/logs/*
}

function reloadPHP(){
	$DIR/php/php$PHP_VERSION/php-fpm reload
	
	/bin/rm -rf $DIR/tmp/xhprof/*.xhprof
	/bin/rm -rf $DIR/tmp/session/sess_*
	/bin/rm -rf $DIR/tmp/logs/*
	/bin/rm -rf $DIR/tmp/xdebug/*
}

if [ $2 = "start" ];then 
	checkPHPStart
	startPHP
fi

if [ $2 = "stop" ];then 
	stopPHP
	checkPHPStop
fi

if [ $2 = "reload" ];then 
	reloadPHP
fi