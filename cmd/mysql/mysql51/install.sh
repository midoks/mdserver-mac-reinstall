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


VERSION=5.1.73
MY_VERSION=51

if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-osx10.6-x86_64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-osx10.6-x86_64.tar.gz https://cdn.mysql.com/archives/mysql-5.1/mysql-${VERSION}-osx10.6-x86_64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-osx10.6-x86_64 ]; then
	cd $MDIR/source/mysql && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-osx10.6-x86_64.tar.gz
fi


if [ ! -d $DIR/mysql/mysql${MY_VERSION} ];then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp -r $MDIR/source/mysql/mysql-${VERSION}-osx10.6-x86_64/ $DIR/mysql/mysql${MY_VERSION}
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION}/my.cnf ]; then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp $MDIR/bin/reinstall/tpl/mysql/my51.cnf $DIR/mysql/mysql${MY_VERSION}/my.cnf
fi

#mysql 5.1, 5.6版本,直接初始化表
if [ ! -d $DIR/mysql/mysql${MY_VERSION}/data/mysql ];then
	echo "init mysql table"
	$DIR/mysql/mysql${MY_VERSION}/scripts/mysql_install_db \
	--basedir=$DIR/mysql/mysql${MY_VERSION} \
	--datadir=$DIR/mysql/mysql${MY_VERSION}/data \
	--user=mysql

	sleep 2
fi


#mysql init pwd
if [ ! -f $DIR/mysql/mysql${MY_VERSION}/data/mysql.log ]; then
cd $DIR/mysql/mysql${MY_VERSION}
echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe \
--defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf \
--user=mysql &"
$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe \
--defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf \
--user=mysql &

echo "modifys password"
sleep 3
$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -u root password root

echo "modifys password ok"

sleep 3
$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -proot shutdown

echo "shutdown ok"
fi


