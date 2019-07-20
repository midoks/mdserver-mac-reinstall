#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

cd $DIR/mysql8

# ps -ef | grep mysql | grep -v grep | awk -F ' ' '{print $2}' | xargs kill

$DIR/mysql8/bin/mysqld \
--defaults-file=$DIR/tmp/my8.cnf \
--user=mysql&