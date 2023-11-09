#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

MY_VERSION=55
echo "$DIR/mysql/mysql${MY_VERSION}/bin/mysqld --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf &"

cd $DIR/mysql/mysql${MY_VERSION}


$DIR/mysql/mysql${MY_VERSION}/bin/mysqld --defaults-file=$DIR/mysql/mysql${MY_VERSION}/my.cnf &