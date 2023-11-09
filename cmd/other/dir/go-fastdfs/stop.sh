#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


echo '' > $MDIR/bin/logs/reinstall/cmd_other_dir_go-fastdfs_install.log
echo "stop!" > $LOG_FILE

FIND_IS_STOP=`ps -ef|grep fileserver| grep -v grep |awk -F ' ' '{print $2}'`

if [ "$FIND_IS_STOP" == '' ];then
	echo "already stop!"
	exit 0
fi

kill -9 $FIND_IS_STOP

echo "ok!"