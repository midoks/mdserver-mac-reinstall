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
	if [ -f /tmp/php-fpm.pid ];then
		rm -rf /tmp/php-fpm.pid
	fi
}

function startPHP(){
	$DIR/php/php$PHP_VERSION/php-fpm start
}

function stopPHP(){
	$DIR/php/php$PHP_VERSION/php-fpm stop
	
	/bin/rm -rf $DIR/tmp/xhprof/*.xhprof
	/bin/rm -rf $DIR/tmp/session/sess_*
}

if [ $2 = "start" ];then 
	checkPHPStart
	startPHP
fi

if [ $2 = "stop" ];then 
	stopPHP
	checkPHPStop
fi