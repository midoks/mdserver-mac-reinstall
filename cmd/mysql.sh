#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
PATH=$PATH:$DIR/cmd/
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
PATH=$PATH:$DIR/source/mysql

 # ./configure \
 # --prefix=$DIR/bin/mysql/ \
 # --exec-prefix=$DIR/bin/mysql/ \

#$DIR/bin/logs/install_mysql.log

# cmake -DCMAKE_INSTALL_PREFIX=$DIR/bin/mysql \
# -DMYSQL_UNIX_ADDR=$DIR/bin/mysql/data/mysql.sock \
# -DDEFAULT_CHARSET=utf8 \
# -DDEFAULT_COLLATION=utf8_general_ci \
# -DWITH_EXTRA_CHARSETS:STRING=utf8,gbk \
# -DWITH_MYISAM_STORAGE_ENGINE=1 \
# -DWITH_INNOBASE_STORAGE_ENGINE=1 \
# -DWITH_MEMORY_STORAGE_ENGINE=1 \
# -DWITH_READLINE=1 \
# -DENABLED_LOCAL_INFILE=1 \
# -DMYSQL_DATADIR=/var/mysqldata \
# -DMYSQL_USER=mysql \
# -DMYSQL_TCP_PORT=3306


# make && make install 
#&& make clean

# # mysql 5.1, 5.6版本,直接初始化表
$DIR/bin/mysql/scripts/mysql_install_db \
--basedir=$DIR/bin/mysql \
--datadir=$DIR/bin/mysql/data \
--user=mysql

sleep 2

# $DIR/bin/mysql/bin/mysqld \
# --basedir=$DIR/bin/mysql/ \
# --datadir=$DIR/bin/mysql/data/ \
# --log-error=$DIR/bin/mysql/data/localhost.log \
# --pid-file=$DIR/bin/mysql/data/localhost.pid \
# --user=mysql &



cd $DIR/bin/mysql/
$DIR/bin/mysql/bin/mysqld_safe \
--defaults-file=$DIR/bin/tmp/my.cnf \
--user=mysql&

sleep 3

$DIR/bin/mysql/bin/mysqladmin -u root password root

sleep 3

$DIR/bin/mysql/bin/mysqladmin -uroot -proot shutdown
