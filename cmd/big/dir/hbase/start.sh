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

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_hbase_start.log
echo "start!" > $LOG_FILE


export JAVA_HOME=/usr/
echo "$APP_DIR/hbase-${VERSION}"
cd $APP_DIR/hbase-${VERSION}

./bin/hbase-daemon.sh start master &

echo "ok!"