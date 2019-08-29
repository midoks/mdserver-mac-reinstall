#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=php71
VERSION=1.0.0
DOCKER_CON_NAME=php71

echo '' > $MDIR/bin/logs/reinstall/cmd_docker-php_start.log

echo "docker run  -p 9901:8031 -d --cap-add=SYS_PTRACE --name ${DOCKER_CON_NAME} $DOCKERNAME:$VERSION"
docker run -p 9901:8031 -d --cap-add=SYS_PTRACE --name ${DOCKER_CON_NAME} $DOCKERNAME:$VERSION

SIGN=`docker ps | grep ${DOCKER_CON_NAME} | awk '{print $1}'`


echo "\r\n"
echo "into master shell:"
echo "docker exec -it $SIGN /bin/bash\r\n"
# ------------------  master end -----------------------


echo "ok!"