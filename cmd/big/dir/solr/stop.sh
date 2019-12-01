#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


VERSION=8.3.0
mkdir -p $MDIR/source/solr
SOLR_DIR=$MDIR/source/solr

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_solr_stop.log
echo "stop!" > $LOG_FILE


function stop_solr(){

    pid=$(ps ax | grep -i 'solr' | grep java | grep -v grep | awk '{print $1}')
    echo $pid
    kill -9 $pid
}


stop_solr


echo "ok!"