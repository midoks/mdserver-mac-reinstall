#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

# cd /Applications/mdserver/bin/reinstall/cmd/mysql/mysql90 && bash install.sh

LOG_FILE=$MDIR/bin/logs/reinstall/mysql_90_install.log
echo "" > $LOG_FILE


mkdir -p $MDIR/source/mysql

VERSION=9.0.1
MY_VERSION=90


if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-macos14-arm64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-macos14-arm64.tar.gz https://cdn.mysql.com/archives/mysql-9.0/mysql-${VERSION}-macos14-arm64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-macos14-arm64.tar.gz ]; then
	cd $MDIR/source/mysql && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-macos14-arm64.tar.gz
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION} ];then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp -r $MDIR/source/mysql/mysql-${VERSION}-macos14-arm64/ $DIR/mysql/mysql${MY_VERSION}
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION}/my.cnf ]; then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp $MDIR/bin/reinstall/tpl/mysql/my${MY_VERSION}.cnf $DIR/mysql/mysql${MY_VERSION}/my.cnf
fi

#mysql9 版本,直接初始化表
if [ ! -d $DIR/mysql/mysql${MY_VERSION}/data/mysql.ibd ];then
	$DIR/mysql/mysql${MY_VERSION}/bin/mysqld \
	--basedir=$DIR/mysql/mysql${MY_VERSION} \
	--datadir=$DIR/mysql/mysql${MY_VERSION}/data \
	--initialize-insecure

	sleep 2
fi


#mysql init pwd
if [ ! -f $DIR/mysql/mysql${MY_VERSION}/data ]; then

# cd $DIR/mysql/mysql${MY_VERSION}

# PASSWORD=`cat $MDIR/bin/logs/reinstall/mysql_90_install.log | grep root@localhost | awk -F 'root@localhost:' '{print $2}'` 
# PASSWORD=${PASSWORD%% }
# PASSWORD=${PASSWORD## }

# echo $PASSWORD
# sleep 1

$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot password root

echo "MYSQL PROT: 3390" >> $LOG_FILE
echo "MYSQL PASSWORD:root" >> $LOG_FILE

$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf &

sleep 2

# echo "use mysql;
# flush privileges;
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
# flush privileges;
# " > /tmp/tmp_sql80.sql

# $DIR/mysql/mysql$MY_VERSION/bin/mysql --defaults-file=$DIR/mysql/mysql$MY_VERSION/my.cnf -uroot -p"$PASSWORD" < /tmp/tmp_sql80.sql
# rm -rf /tmp/tmp_sql80.sql

# sleep 1
$DIR/mysql/mysql${MY_VERSION}/bin/mysqladmin --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -proot shutdown

echo "shutdown ok"
fi

