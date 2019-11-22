#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_nsq_stop.log
echo "stop!" > $LOG_FILE

FIND_IS_INSTALL=`ps -ef|grep nsqd| grep -v grep |awk -F ' ' '{print $2}'`

if [ "$FIND_IS_INSTALL" == '' ];then
	echo "already stop!"
	exit 0
fi

brew services stop nsq

echo "ok!"