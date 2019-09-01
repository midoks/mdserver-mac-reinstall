#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=go
VERSION=1.0.0
DOCKER_CON_NAME=go

echo '' > $MDIR/bin/logs/reinstall/cmd_docker-go_start.log

echo "docker run  -p 9090:80 -d --cap-add=SYS_PTRACE --name ${DOCKER_CON_NAME} $DOCKERNAME:$VERSION"
docker run -p 9090:80 -d --cap-add=SYS_PTRACE --name ${DOCKER_CON_NAME} $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME} | awk '{print $1}'`


echo "\r\n"
echo "into master shell:"
echo "docker run -it $DOCKERNAME:$VERSION sh\r\n"
echo "docker exec -it $SIGN bash\r\n"
# ------------------  master end -----------------------


echo "ok!"