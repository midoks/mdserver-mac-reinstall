#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


VERSION=2.3.1
SCALE_VERSION=2.12
mkdir -p $MDIR/source/kafka
KAFKA_DIR=$MDIR/source/kafka

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_kafka_stop.log
echo "stop!" > $LOG_FILE


function stop_kafka(){

    kafka_pid2=$(ps -ef|grep kafka| sed -n '1,1p' | awk '{print $2}')
    echo $kafka_pid2
    kill -9 $kafka_pid2

    kafka_pid=$(ps ax | grep -i 'kafka.Kafka' | grep java | grep -v grep | awk '{print $1}')
    echo $kafka_pid
    kill -9 $kafka_pid
}


stop_kafka


cd $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}
#可以注释
rm -rf ./kafka-logs
rm -rf ./logs
rm -rf ./zookeeper

echo "ok!"