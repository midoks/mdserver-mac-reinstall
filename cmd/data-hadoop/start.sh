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


# ------------------  master start ---------------------
H_DAY=`date +%Y%m%d%H%M%S`
DOCKER_CON_NAME_TIME=${DOCKER_CON_NAME}_master_${H_DAY}


LOG_FILE=$MDIR/bin/logs/reinstall/cmd_data-hadoop_start.log
echo "start!" > $LOG_FILE

echo $DOCKER_CON_NAME_TIME
docker run  -p  9901:9001 \
	-h master \
	-d --cap-add=SYS_PTRACE \
	--net=bridge \
	--name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME}_master | awk '{print $1}'`

echo "\r\n"
echo "into master shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  master end -----------------------



# ------------------  slave1 start ---------------------
H_DAY=`date +%Y%m%d%H%M%S`
DOCKER_CON_NAME_TIME=${DOCKER_CON_NAME}_slave1_${H_DAY}

echo $DOCKER_CON_NAME_TIME
docker run \
	-h slave1 \
	-d --cap-add=SYS_PTRACE \
	--net=bridge \
	--name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME}_slave1 | awk '{print $1}'`

echo "\r\n"
echo "into slave1 shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  slave1 end -----------------------


# ------------------  slave2 start ---------------------
H_DAY=`date +%Y%m%d%H%M%S`
DOCKER_CON_NAME_TIME=${DOCKER_CON_NAME}_slave2_${H_DAY}

echo $DOCKER_CON_NAME_TIME
docker run \
	-h slave1 \
	-d --cap-add=SYS_PTRACE \
	--net=bridge \
	--name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME}_slave2 | awk '{print $1}'`

echo "\r\n"
echo "into slave2 shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  slave2 end -----------------------


echo "ok!"