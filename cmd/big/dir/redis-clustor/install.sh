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


REDIS_CLUSTOR_DIR=$MDIR/source/redis-clustor
mkdir -p $REDIS_CLUSTOR_DIR


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_big_dir_redis-clusor_install.log
echo "-----------" > $LOG_FILE
echo 'install redis-clusor start'


REDIS_LIST=("1" "2" "3")

for i in ${REDIS_LIST[*]}
do
	echo $i
	if [ ! -d $REDIS_CLUSTOR_DIR/redis${i} ];then
		mkdir -p $REDIS_CLUSTOR_DIR/redis${i}
		cp -rf $MDIR/bin/redis/ $REDIS_CLUSTOR_DIR/redis${i}/
	fi

	cd $REDIS_CLUSTOR_DIR/redis${i}/data && rm -rf $REDIS_CLUSTOR_DIR/redis${i}/data/
	mkdir -p $REDIS_CLUSTOR_DIR/redis${i}/data/

	rm -rf $REDIS_CLUSTOR_DIR/redis${i}/etc/redis.conf
	cp -rf $DIR_PWD/tpl/redis.conf $REDIS_CLUSTOR_DIR/redis${i}/etc/

	PORT=700${i}
	DATA_DIR=$REDIS_CLUSTOR_DIR/redis${i}/data/
	sed -i '_bak' "s#{PORT}#${PORT}#g" $REDIS_CLUSTOR_DIR/redis${i}/etc/redis.conf
	sed -i '_bak' "s#{DATA_DIR}#${DATA_DIR}#g" $REDIS_CLUSTOR_DIR/redis${i}/etc/redis.conf
done



echo 'install redis-clusor end'
echo "-----------" >> $LOG_FILE