#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_nsq_start.log
echo "start!" > $LOG_FILE


FIND_IS_INSTALL=`ps -ef|grep nsqd| grep -v grep |awk -F ' ' '{print $2}'`

if [ "$FIND_IS_INSTALL" != '' ];then
	echo "already start!"
	exit 0
fi

brew services start nsq


echo "ok!"