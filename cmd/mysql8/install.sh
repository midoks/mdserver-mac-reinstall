#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

# https://downloads.mysql.com/archives/community/
mkdir -p $MDIR/source/mysql


VERSION=8.0.16


if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-osx10.14-x86_64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64.tar.gz https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-${VERSION}-macos10.14-x86_64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64.tar.gz ]; then
	cd $MDIR/source/mysql8 && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64.tar.gz
fi


if [ ! -d $DIR/mysql ];then
	mkdir -p $DIR/mysql
	cp -r $MDIR/source/mysql/mysql-${VERSION}-macos10.14-x86_64/ $DIR/mysql8/
fi

if [ ! -d $DIR/tmp/my.cnf ]; then
	mkdir -p $DIR/tmp
	cp $MDIR/bin/reinstall/tpl/mysql/my.cnf $DIR/tmp/
fi

#mysql 5.1, 5.6版本,直接初始化表
if [ ! -d $DIR/mysql/data/mysql ];then
	$DIR/mysql/scripts/mysql_install_db \
	--basedir=$DIR/mysql \
	--datadir=$DIR/mysql/data \
	--user=mysql

	sleep 2
fi


#mysql init pwd
if [ ! -f $DIR/mysql/data/mysql.log ]; then
cd $DIR/mysql/
$DIR/mysql/bin/mysqld_safe \
--defaults-file=$DIR/tmp/my.cnf \
--user=mysql&

sleep 3
$DIR/mysql/bin/mysqladmin -u root password root

sleep 3
$DIR/mysql/bin/mysqladmin -uroot -proot shutdown
fi


