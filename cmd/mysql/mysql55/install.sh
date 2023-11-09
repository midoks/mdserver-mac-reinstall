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


VERSION=5.5.53
MY_VERSION=55

if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-osx10.9-x86_64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-osx10.9-x86_64.tar.gz https://cdn.mysql.com/archives/mysql-5.5/mysql-${VERSION}-osx10.9-x86_64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-osx10.9-x86_64 ]; then
	cd $MDIR/source/mysql && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-osx10.9-x86_64.tar.gz
fi


if [ ! -d $DIR/mysql/mysql${MY_VERSION} ];then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp -r $MDIR/source/mysql/mysql-${VERSION}-osx10.9-x86_64/ $DIR/mysql/mysql${MY_VERSION}
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION}/my.cnf ]; then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp $MDIR/bin/reinstall/tpl/mysql/my55.cnf $DIR/mysql/mysql${MY_VERSION}/my.cnf
fi

#mysql 5.1, 5.6版本,直接初始化表
if [ ! -f $DIR/mysql/mysql${MY_VERSION}/data/mysql.log ];then
	echo "$DIR/mysql/mysql${MY_VERSION}/scripts/mysql_install_db --basedir=$DIR/mysql/mysql${MY_VERSION} --datadir=$DIR/mysql/mysql${MY_VERSION}/data --user=mysql"

	$DIR/mysql/mysql${MY_VERSION}/scripts/mysql_install_db \
	--basedir=$DIR/mysql/mysql${MY_VERSION} \
	--datadir=$DIR/mysql/mysql${MY_VERSION}/data

	sleep 2
fi


#mysql init pwd
if [ ! -f $DIR/mysql/mysql${MY_VERSION}/data/mysql.log ]; then
	cd $DIR/mysql/mysql${MY_VERSION}
	$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe \
	--defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf &
	echo "modifys password"
	sleep 3
	$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -u root password root
	echo "modifys password ok"
	sleep 3
	$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -proot shutdown
	echo "shutdown ok"
fi


