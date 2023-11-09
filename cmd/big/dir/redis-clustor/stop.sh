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


REDIS_CLUSTOR_DIR=$MDIR/source/redis-clustor
mkdir -p $REDIS_CLUSTOR_DIR

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_redis-clustor_stop.log
echo "stop!" > $LOG_FILE


REDIS_LIST=("1" "2" "3" "4" "5" "6")

for i in ${REDIS_LIST[*]}
do
	PORT=700${i}
	FIND_PORT=`ps -ef|grep *:$PORT | grep -v grep | awk '{print $2}'`
	if [ "$FIND_PORT" != "" ];then
		$REDIS_CLUSTOR_DIR/redis/bin/redis-cli -p ${PORT} shutdown
	fi
done


function stop_redis_clustor(){

    pid=$(ps ax | grep -i 'redis' | grep -v grep | awk '{print $1}')
    echo $pid
    kill -9 $pid
}


stop_redis_clustor

echo "ok!"