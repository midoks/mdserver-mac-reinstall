#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_other_dir_postgresql_start.log
if [ -f ];then
	echo '' > LOG_FILE
	echo "start!" > $LOG_FILE
fi

FIND_IS_RUN=`ps -ef|grep postgresql| grep -v grep |awk -F ' ' '{print $2}'`

if [ "$FIND_IS_RUN" != '' ];then
	echo "already run!"
	exit 0
fi
brew services start postgresql

echo "ok!"