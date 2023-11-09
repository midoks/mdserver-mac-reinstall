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


VERSION=2.2.2
mkdir -p $MDIR/source/hbase
APP_DIR=$MDIR/source/hbase

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_hbase_stop.log
echo "stop!" > $LOG_FILE


function stop_hbase(){
    ps ax | grep -i 'hbase' | grep java | grep -v grep | awk '{print $1}' | xargs kill
}

stop_hbase

echo "ok!"