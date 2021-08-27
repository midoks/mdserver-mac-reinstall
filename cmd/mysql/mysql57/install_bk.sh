#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


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

echo "mysql5.7无法通过命令初始化密码"

echo "----------------------- do cmd start -------------------------"

echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --skip-grant-tables &"
echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysql --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -p"
echo "mysql server$ use mysql;"
echo "mysql server$ update user set authentication_string=password('root123') where user='root';"
echo "mysql server$ flush privileges;"
echo "mysql server$ exit;"

echo "ps -ef|grep mysql57 |grep -v grep|awk '{print \$2}'|xargs kill"

echo "----------------------- reset -------------------------"

echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf --user=mysql &"
echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysql --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -p"
echo "mysql server$ SET PASSWORD = PASSWORD('root');"
echo "mysql server$ use mysql;"
echo "mysql server$ ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;"
echo "mysql server$ update user set authentication_string=password('root') where user='root';"
echo "mysql server$ flush privileges;"
echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin -uroot -proot shutdown"

echo "----------------------- do cmd end -------------------------"
