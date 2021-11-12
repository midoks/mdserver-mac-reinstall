#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
PATH=$PATH:$DIR/cmd


echo '' > $DIR/logs/redis.log
echo '' > $DIR/logs/redis_err.log
/bin/sh $DIR/redis_log.sh $1 >> $DIR/logs/redis.log 2>$DIR/logs/redis_err.log