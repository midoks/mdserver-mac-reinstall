#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=mdserver-web
VERSION=v1.0.0
DOCKER_CON_NAME=mdserver-web

# ------------------  master start ---------------------

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_mdserver-web_start.log
echo "start!" > $LOG_FILE

echo $DOCKER_CON_NAME
echo "docker run -p 7200:7200 -d --cap-add=SYS_PTRACE --name $DOCKER_CON_NAME_TIME $DOCKERNAME:$VERSION"
docker run -p 7200:7200 -d --cap-add=SYS_PTRACE --name $DOCKER_CON_NAME $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME} | awk '{print $1}'`

echo "\r\n"
echo "into master shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  master end -----------------------

echo "ok!"