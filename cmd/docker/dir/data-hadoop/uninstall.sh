#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=hadoop
VERSION=v1.0.0
DOCKER_CON_NAME=hadoop

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_docker_dir_data-hadoop_uninstall.log
echo "uninstall!" > $LOG_FILE

SIGN=`docker ps -a |grep $DOCKER_CON_NAME | awk '{print $1}'`
echo "docker stop $SIGN"
docker stop $SIGN

echo "docker rm -f $SIGN"
docker rm -f $SIGN

echo 'ok'