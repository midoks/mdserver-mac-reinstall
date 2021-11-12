#! /bin/sh

DIR=$(cd "$(dirname "$0")"; pwd)
PATH=$PATH:$DIR/cmd

echo $1

function redis_start()
{
	#echo "$DIR/redis/bin/redis-server $DIR/redis/etc/redis.conf"
	$DIR/redis/bin/redis-server $DIR/redis/etc/redis.conf
}

function redis_stop()
{
	#echo "$DIR/redis/bin/redis-cli -p 6379 shutdown"
	$DIR/redis/bin/redis-cli -p 6379 shutdown
	cd $DIR/redis/data && rm -rf redis.pid
}


if [ $1 = "start" ];then
	redis_start
fi



if [[ $1 = "stop" ]];then
	redis_stop
fi
