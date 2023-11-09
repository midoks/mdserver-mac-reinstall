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

VERSION=2.3.1
SCALE_VERSION=2.12
mkdir -p $MDIR/source/kafka
KAFKA_DIR=$MDIR/source/kafka


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_kafka_start.log
echo "start!" > $LOG_FILE

echo "cd $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}"
cd $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}

echo "begin zookeeper service!"
echo "./bin/zookeeper-server-start.sh \
./config/zookeeper.properties &"
./bin/zookeeper-server-start.sh \
./config/zookeeper.properties &


echo "begin kafka service!"
echo "./bin/kafka-server-start.sh \
./config/server.properties &"
./bin/kafka-server-start.sh \
./config/server.properties &

echo "--topic--"
echo "./bin/kafka-topics.sh \
--create \
--replication-factor 1 \
--partitions 1 \
--zookeeper 127.0.0.1:2181 \
--topic kafka_message"
# ./bin/kafka-topics.sh \
# --create \
# --replication-factor 1 \
# --partitions 1 
# --zookeeper 127.0.0.1:2181 \
# --topic kafka_message

echo "-- topic list --"
echo "./bin/kafka-topics.sh \
--list \
--zookeeper 127.0.0.1:2181"
./bin/kafka-topics.sh \
--list \
--zookeeper 127.0.0.1:2181


echo "--producer--"
echo "./bin/kafka-console-producer.sh \
--broker-list 127.0.0.1:9092 \
--topic kafka_message"
./bin/kafka-console-producer.sh \
--broker-list 127.0.0.1:9092 \
--topic kafka_message


echo "--consumer--"
echo "./bin/kafka-console-consumer.sh \
--bootstrap-server 127.0.0.1:9092 \
--topic kafka_message \
--from-beginning"
./bin/kafka-console-consumer.sh \
--bootstrap-server 127.0.0.1:9092 \
--topic kafka_message \
--from-beginning

echo "ok!"