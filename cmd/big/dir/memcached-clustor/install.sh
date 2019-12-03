#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR_PWD=$DIR
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


MEM_CLUSTOR_DIR=$MDIR/source/memcached-clustor
mkdir -p $MEM_CLUSTOR_DIR


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_memcached-clusor_install.log
echo "-----------" > $LOG_FILE
echo 'install memcached-clusor start'

if [ ! -d $MEM_CLUSTOR_DIR/memcached ];then
	mkdir -p $MEM_CLUSTOR_DIR/memcached
	cp -rf $MDIR/bin/memcached/ $MEM_CLUSTOR_DIR/memcached/
fi

echo 'install memcached-clusor end'
echo "-----------" >> $LOG_FILE