#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=hadoop
VERSION=v1.0.0
DOCKER_CON_NAME=hadoop_docker

H_DAY=`date +%Y%m%d%H%M%S`

DOCKER_CON_NAME_TIME=${DOCKER_CON_NAME}_${H_DAY}


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_data-hadoop_start.log
echo "start!" > $LOG_FILE

echo $DOCKER_CON_NAME_TIME
docker run  -p  9901:9001 -p 9970:50070 -p 9930:50030 \
	-d --cap-add=SYS_PTRACE \
	--net=bridge \
	--name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION



SIGN=`docker ps | grep $DOCKER_CON_NAME | awk '{print $1}'`

echo "into shell:\r\n"
echo "docker exec -it $SIGN /bin/bash\r\n"
echo "ok!"