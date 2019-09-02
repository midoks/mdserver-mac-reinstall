#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=tdengine
VERSION=v1.0.0
DOCKER_CON_NAME=tdengine



# ------------------  master start ---------------------
H_DAY=`date +%Y%m%d%H%M%S`
DOCKER_CON_NAME_TIME=${DOCKER_CON_NAME}_${H_DAY}


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_docker_dir_iot-tdengine_start.log
echo "start!" > $LOG_FILE

echo "\$HADOOP_CONFIG_HOME/slaves"

echo $DOCKER_CON_NAME_TIME
echo "docker run  -p  9901:8031 \
	-d --cap-add=SYS_PTRACE \
	--net=bridge \
	--name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION"
docker run  -p  6020:6020 \
	--cpus=1 \
	-d --cap-add=SYS_PTRACE \
	--net=bridge \
	--name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME} | awk '{print $1}'`

echo "\r\n"
echo "into master shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  master end -----------------------

echo "taos -c /root/TDengine-master/build/test/cfg"


echo "ok!"