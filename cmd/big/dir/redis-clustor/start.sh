#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

REDIS_CLUSTOR_DIR=$MDIR/source/redis-clustor
mkdir -p $REDIS_CLUSTOR_DIR


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_redis-clustor_start.log
echo "start!" > $LOG_FILE

REDIS_LIST=("1" "2" "3")

for i in ${REDIS_LIST[*]}
do
	$REDIS_CLUSTOR_DIR/redis${i}/bin/redis-server $REDIS_CLUSTOR_DIR/redis${i}/etc/redis.conf
done
echo "ok!"