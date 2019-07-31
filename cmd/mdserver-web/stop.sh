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

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_mdserver-web_stop.log
echo "stop!" > $LOG_FILE

echo "docker ps -a |grep $DOCKER_CON_NAME | awk '{print \$1}'"
SIGN=`docker ps -a |grep $DOCKER_CON_NAME | awk '{print $1}'`
if [ "$SIGN" == "" ];then
	echo "ok!"
	exit 0
fi
echo "docker stop $SIGN"
docker stop $SIGN
echo "docker rm -f $SIGN"
docker rm -f $SIGN

echo "ok!"