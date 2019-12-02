#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

# gem sources -a https://rubygems.org/
# /usr/bin/gem install redis -v 3.2.1

echo "$MDIR/source/redis-clustor/redis/bin/redis-cli -c -h 127.0.0.1 -p 7001"

REDIS_CLUSTOR_DIR=$MDIR/source/redis-clustor
mkdir -p $REDIS_CLUSTOR_DIR


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_redis-clustor_start.log
echo "start!" > $LOG_FILE

REDIS_LIST=("1" "2" "3" "4" "5" "6")

REDIS_CLUSTOR_STR=""

for i in ${REDIS_LIST[*]}
do
	$REDIS_CLUSTOR_DIR/redis/bin/redis-server $REDIS_CLUSTOR_DIR/redis${i}/etc/redis.conf
	REDIS_CLUSTOR_STR="${REDIS_CLUSTOR_STR}127.0.0.1:700${i} "
done

# echo $REDIS_CLUSTOR_STR
echo "$REDIS_CLUSTOR_DIR/redis-trib.rb create --replicas 1 $REDIS_CLUSTOR_STR"
# $REDIS_CLUSTOR_DIR/redis-trib.rb create --replicas 1 $REDIS_CLUSTOR_STR
echo "ok!"