#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

# https://downloads.mysql.com/archives/community/
mkdir -p $MDIR/source/mysql


VERSION=5.7.27
MY_VERSION=57

if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64.tar.gz https://cdn.mysql.com/archives/mysql-5.7/mysql-${VERSION}-macos10.14-x86_64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64 ]; then
	cd $MDIR/source/mysql && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64.tar.gz
fi


if [ ! -d $DIR/mysql/mysql${MY_VERSION} ];then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp -r $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64/ $DIR/mysql/mysql${MY_VERSION}
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION}/my.cnf ]; then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp $MDIR/bin/reinstall/tpl/mysql/my${MY_VERSION}.cnf $DIR/mysql/mysql${MY_VERSION}/my.cnf
fi
#mysql 5.7版本,直接初始化表
if [ ! -d $DIR/mysql/mysql${MY_VERSION}/data/mysql ];then

	echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf --initialize"
	$DIR/mysql/mysql${MY_VERSION}/bin/mysqld --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf --initialize --explicit_defaults_for_timestamp
	sleep 2
fi


#mysql init pwd

echo "----------------------- do cmd start -------------------------"

$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf --skip-grant-tables &
sleep 2

echo "use mysql;
flush privileges;
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
update user set authentication_string=password('root123') where user='root';
flush privileges;
" > /tmp/tmp_sql57.sql



$DIR/mysql/mysql$MY_VERSION/bin/mysql --defaults-file=$DIR/mysql/mysql$MY_VERSION/my.cnf -uroot -p" " < /tmp/tmp_sql57.sql

rm -rf /tmp/tmp_sql57.sql

sleep 1

# CC=`ps -ef|grep mysql57`
# echo $CC
ps -ef|grep mysql57/data |grep -v grep|awk '{print $2}'|xargs kill
# $DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -proot123 shutdown
sleep 2
echo "----------------------- reset -------------------------"

echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf "
$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf &
sleep 2

echo "----------------------- do cmd start -------------------------"

echo "SET PASSWORD = PASSWORD('root');
use mysql;
flush privileges;
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
update user set authentication_string=password('root') where user='root';
flush privileges;
" > /tmp/tmp_sql57.sql

echo "$DIR/mysql/mysql$MY_VERSION/bin/mysql --defaults-file=$DIR/mysql/mysql$MY_VERSION/my.cnf --connect-expired-password -uroot -proot123 < /tmp/tmp_sql57.sql"
$DIR/mysql/mysql$MY_VERSION/bin/mysql --defaults-file=$DIR/mysql/mysql$MY_VERSION/my.cnf --connect-expired-password -uroot -proot123 < /tmp/tmp_sql57.sql

rm -rf /tmp/tmp_sql57.sql
sleep 1
echo "----------------------- do cmd end -------------------------"


echo "----------------------- do shutdown start -------------------------"

$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql$MY_VERSION/my.cnf -uroot -proot shutdown

echo "----------------------- do shutdown ok -------------------------"
