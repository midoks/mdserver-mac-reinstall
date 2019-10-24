#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

# https://github.com/midoks/mysql-server
mkdir -p $MDIR/source/mysql_debug


if [ ! -d $MDIR/source/mysql_debug/mysql-server ]; then
	cd $MDIR/source/mysql_debug && git clone https://github.com/midoks/mysql-server
else 
	cd $MDIR/source/mysql_debug && git pull && git checkout 5.6_md_debug
fi


if [ ! -d $DIR/mysql_debug ];then
	echo "$MDIR/source/mysql_debug/mysql-server 
	 && cmake . -G \"Xcode\" -DWITH_DEBUG=1 \
	-DMYSQL_DATADIR=$MDIR/mysql56/data \
	-DWITH_INNOBASE_STORAGE_ENGINE=1 \
	-DCMAKE_INSTALL_PREFIX=$MDIR/mysql56 \
	-DDEFAULT_CHARSET=utf8 \
	-DDEFAULT_COLLATION=utf8_general_ci \
	-DMYSQL_UNIX_ADDR=/tmp/mysql56.sock \
	&& make && make install"

	cd $MDIR/source/mysql_debug/mysql-server \
	&& cmake . -G "Xcode" -DWITH_DEBUG=1 \
	-DMYSQL_DATADIR=$MDIR/mysql56/data \
	-DWITH_INNOBASE_STORAGE_ENGINE=1 \
	-DCMAKE_INSTALL_PREFIX=$MDIR/mysql56 \
	-DDEFAULT_CHARSET=utf8 \
	-DDEFAULT_COLLATION=utf8_general_ci \
	-DMYSQL_UNIX_ADDR=/tmp/mysql56.sock \
	&& make && make install
fi

# if [ ! -d $DIR/tmp/my.cnf ]; then
# 	mkdir -p $DIR/tmp
# 	cp $MDIR/bin/reinstall/tpl/mysql/my.cnf $DIR/tmp/
# fi

#mysql 5.1, 5.6版本,直接初始化表
# if [ ! -d $DIR/mysql/data/mysql ];then
# 	$DIR/mysql/scripts/mysql_install_db \
# 	--basedir=$DIR/mysql \
# 	--datadir=$DIR/mysql/data \
# 	--user=mysql

# 	sleep 2
# fi


#mysql init pwd
# if [ ! -f $DIR/mysql/data/mysql.log ]; then
# cd $DIR/mysql/
# $DIR/mysql/bin/mysqld_safe \
# --defaults-file=$DIR/tmp/my.cnf \
# --user=mysql&

# sleep 3
# $DIR/mysql/bin/mysqladmin -u root password root

# sleep 3
# $DIR/mysql/bin/mysqladmin -uroot -proot shutdown
# fi

