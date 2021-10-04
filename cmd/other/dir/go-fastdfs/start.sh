#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


echo '' > $MDIR/bin/logs/reinstall/cmd_other_dir_go-fastdfs_install.log
echo "start!" > $LOG_FILE


FIND_IS_RUN=`ps -ef|grep fileserver| grep -v grep |awk -F ' ' '{print $2}'`

if [ "$FIND_IS_RUN" != '' ];then
	echo "already run!"
	exit 0
fi

cd $MDIR/source/go-fastdfs/demo/ && chmod +x fileserver  && ./fileserver &


echo "ok!"