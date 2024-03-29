#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/mysql_80_install.log
echo "" > $LOG_FILE


mkdir -p $MDIR/source/mysql

VERSION=8.0.25
MY_VERSION=80


if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-macos11-x86_64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-macos11-x86_64.tar.gz https://cdn.mysql.com/archives/mysql-8.0/mysql-${VERSION}-macos11-x86_64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-macos11-x86_64 ]; then
	cd $MDIR/source/mysql && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-macos11-x86_64.tar.gz
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION} ];then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp -r $MDIR/source/mysql/mysql-${VERSION}-macos11-x86_64/ $DIR/mysql/mysql${MY_VERSION}
fi

if [ ! -d $DIR/mysql/mysql${MY_VERSION}/my.cnf ]; then
	mkdir -p $DIR/mysql/mysql${MY_VERSION}
	cp $MDIR/bin/reinstall/tpl/mysql/my${MY_VERSION}.cnf $DIR/mysql/mysql${MY_VERSION}/my.cnf
fi

#mysql 8 版本,直接初始化表
if [ ! -d $DIR/mysql/mysql${MY_VERSION}/data/mysql.ibd ];then
	$DIR/mysql/mysql${MY_VERSION}/bin/mysqld \
	--basedir=$DIR/mysql/mysql${MY_VERSION} \
	--datadir=$DIR/mysql/mysql${MY_VERSION}/data \
	--initialize

	sleep 2
fi


#mysql init pwd
if [ ! -f $DIR/mysql/mysql${MY_VERSION}/data ]; then

cd $DIR/mysql/mysql${MY_VERSION}

PASSWORD=`cat $MDIR/bin/logs/reinstall/mysql_80_install.log | grep root@localhost | awk -F 'root@localhost:' '{print $2}'` 
PASSWORD=${PASSWORD%% }
PASSWORD=${PASSWORD## }

echo $PASSWORD
sleep 3


echo "MYSQL PROT: 3306" >> $LOG_FILE
echo "MYSQL PASSWORD:${PASSWORD}" >> $LOG_FILE

echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld_safe --skip-grant-tables &" >> $LOG_FILE
echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysql --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf -uroot -p" >> $LOG_FILE

echo "mysql> use mysql;" >> $LOG_FILE
echo "mysql> flush privileges;"  >> $LOG_FILE
echo "mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';" >> $LOG_FILE


fi

