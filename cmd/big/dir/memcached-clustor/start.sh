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


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_memcached-clustor_start.log
echo "start!" > $LOG_FILE

MEM_LIST=("1" "2" "3")

for i in ${MEM_LIST[*]}
do
	echo $i
	PORT=212${i}
	$MEM_CLUSTOR_DIR/memcached/bin/memcached -d -m 60 -u root l 127.0.0.1 -p $PORT -c 256 -P $MEM_CLUSTOR_DIR/mem_$PORT.pid
done


echo "ok!"