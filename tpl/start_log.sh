#! /bin/bash


DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")
USER=$(who | sed -n "1,1p" |awk '{print $1}')
PATH=$PATH:$DIR/mysql/bin

function checkNginx(){
	echo "checkNginx"
	if [ -f $DIR/tmp/nginx.pid ];then
		rm -rf $DIR/tmp/nginx.pid
	fi
}

function startNginx(){

	sed "s/\#user/user/g" $DIR/openresty/nginx/conf/nginx.tpl.conf > $DIR/openresty/nginx/conf/nginx.conf
	sed "s/{{USER}}/$USER/g" $DIR/openresty/nginx/conf/nginx.tpl.conf > $DIR/openresty/nginx/conf/nginx.conf

	$DIR/openresty/nginx/sbin/nginx -c $DIR/openresty/nginx/conf/nginx.conf
}

function startMySQL(){

	if [ -f $DIR/mysql/data/mysql.pid ]; then
		rm -rf $DIR/mysql/data/mysql.pid
	fi

	cd $DIR/mysql/
	echo "$DIR/mysql/bin/mysqld_safe --defaults-file=$DIR/tmp/my.cnf --user=mysql&"
	if [ -f $DIR/mysql/data/mysql.log ]; then
		echo ''>$DIR/mysql/data/mysql.log
	fi

	$DIR/mysql/bin/mysqld_safe --defaults-file=$DIR/tmp/my.cnf --user=mysql&
}

if [ $1 = "nginx" ];then
	checkNginx
	startNginx
fi

if [ $1 = "mysql" ];then
	startMySQL
fi