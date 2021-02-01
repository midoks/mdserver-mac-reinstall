#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_mysql8_install.log
echo "" > $LOG_FILE


mkdir -p $MDIR/source/mysql

VERSION=8.0.23
if [ ! -f $MDIR/source/mysql/mysql-${VERSION}-macos10.15-x86_64.tar.gz ]; then
	wget -O $MDIR/source/mysql/mysql-${VERSION}-macos10.15-x86_64.tar.gz https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-${VERSION}-macos10.15-x86_64.tar.gz
fi

if [ ! -d $MDIR/source/mysql/mysql-${VERSION}-macos10.15-x86_64 ]; then
	cd $MDIR/source/mysql && tar -zxvf $MDIR/source/mysql/mysql-${VERSION}-macos10.15-x86_64.tar.gz
fi


if [ ! -d $DIR/mysql8 ];then
	mkdir -p $DIR/mysql8
	cp -r $MDIR/source/mysql/mysql-${VERSION}-macos10.15-x86_64/ $DIR/mysql8/
fi

if [ ! -d $DIR/tmp/my8.cnf ]; then
	mkdir -p $DIR/tmp
	cp $MDIR/bin/reinstall/tpl/mysql/my8.cnf $DIR/tmp/my8.cnf
fi

#mysql 8 版本,直接初始化表
if [ ! -d $DIR/mysql8/data/mysql ];then
	$DIR/mysql8/bin/mysqld \
	--basedir=$DIR/mysql8 \
	--datadir=$DIR/mysql8/data \
	--initialize

	sleep 2
fi


#mysql init pwd
if [ ! -f $DIR/mysql8/data/mysql.log ]; then

cd $DIR/mysql8/

PASSWORD=`cat $MDIR/bin/logs/reinstall/cmd_mysql8_install.log | grep root@localhost | awk -F 'root@localhost:' '{print $2}'` 
PASSWORD=${PASSWORD%% }
PASSWORD=${PASSWORD## }

echo $PASSWORD
sleep 3


echo "MYSQL PROT: 3308" >> $LOG_FILE
echo "MYSQL PASSWORD:${PASSWORD}" >> $LOG_FILE

echo "${DIR}/mysql8/bin/mysql --defaults-file=${DIR}/tmp/my8.cnf -uroot -p" >> $LOG_FILE
echo "alter user user() identified by 'root'" >> $LOG_FILE

fi

