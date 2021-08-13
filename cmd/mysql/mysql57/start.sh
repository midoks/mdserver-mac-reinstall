#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

MY_VERSION=57

cd $DIR/mysql/mysql${MY_VERSION}

#--user=mysql 
$DIR/mysql/mysql${MY_VERSION}/bin/mysqld --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf &