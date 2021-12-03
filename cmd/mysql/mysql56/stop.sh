#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

app=mysql56

if [ -f $MDIR/mysql/$app/data/mysql.pid ];then
	rm -rf $MDIR/mysql/$app/data/mysql.pid
fi

ps -ef | grep $app | grep -v grep | awk -F ' ' '{print $2}' | xargs kill

