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

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_kafka_start.log
echo "start!" > $LOG_FILE

cd $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}

echo "begin service!"
echo "$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/zookeeper-server-start.sh \
$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/config/zookeeper.properties &"
$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/zookeeper-server-start.sh \
$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/config/zookeeper.properties &

echo "--topic--"
echo "$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-topics.sh \
--create \
--replication-factor 1 \
--partitions 1 
--zookeeper 127.0.0.1:2181 \
--topic kafka_message"
# $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-topics.sh \
# --create \
# --replication-factor 1 \
# --partitions 1 
# --zookeeper 127.0.0.1:2181 \
# --topic kafka_message

echo "-- topic list --"
echo "$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-topics.sh \
--list \
--zookeeper 127.0.0.1:2181"
# $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-topics.sh \
# --list \
# --zookeeper 127.0.0.1:2181


echo "--producer--"
echo "$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-console-producer.sh \
--broker-list 127.0.0.1:2181 \
--topic kafka_message"
# $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-console-producer.sh \
# --broker-list 127.0.0.1:2181 \
# --topic kafka_message


echo "--consumer--"
echo "$KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-console-consumer.sh \
--zookeeper 127.0.0.1:2181 \
--topic kafka_message \
--from-beginning"
# $KAFKA_DIR/kafka_${SCALE_VERSION}-${VERSION}/bin/kafka-console-consumer.sh \
# --zookeeper 127.0.0.1:2181 \
# --topic kafka_message \
# --from-beginning

echo "ok!"