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
echo "reload start!" > $LOG_FILE

cd $SDIR
sh ./stop.sh
sleep 1
sh ./start.sh

echo "reload ok!"