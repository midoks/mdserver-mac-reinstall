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


MEM_CLUSTOR_DIR=$MDIR/source/memcached-clustor
mkdir -p $MEM_CLUSTOR_DIR

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_memcached-clustor_stop.log
echo "stop!" > $LOG_FILE


MEM_LIST=("1" "2" "3")

for i in ${MEM_LIST[*]}
do
	echo $i
	PORT=212${i}

	echo "kill -9 `cat $MEM_CLUSTOR_DIR/mem_$PORT.pid`"
	kill -9 `cat $MEM_CLUSTOR_DIR/mem_$PORT.pid`
	rm -rf $MEM_CLUSTOR_DIR/mem_$PORT.pid

done

function stop_mem_clustor(){

    pid=$(ps ax | grep -i 'memcached' | grep -v grep | awk '{print $1}')
    echo $pid
    kill -9 $pid
}


stop_mem_clustor

echo "ok!"