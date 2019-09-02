#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=gitlab
VERSION=1.0.0
DOCKER_CON_NAME=gitlab

echo '' > $MDIR/bin/logs/reinstall/cmd_docker-gitlab_stop.log

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

echo "\r\n\r\n"
SIGN_EXIT=`docker ps -a |grep 'Exited' | awk '{print $1}'`
if [ "$SIGN_EXIT" == "" ];then
	echo "ok!"
	exit 0
fi
echo "other exit rm:"
echo "docker rm -f $SIGN_EXIT"
docker rm -f $SIGN_EXIT
echo "ok!"


echo "\r\n\r\n"
SIGN_EXIT=`docker ps -a |grep 'Removal' | awk '{print $1}'`
if [ "$SIGN_EXIT" == "" ];then
	echo "ok!"
	exit 0
fi
echo "other exit rm:"
echo "docker rm -f $SIGN_EXIT"
docker rm -f $SIGN_EXIT
echo "ok!"

echo "ok!"