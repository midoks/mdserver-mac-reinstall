#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


DOCKERNAME=mysql
VERSION=56
DOCKER_CON_NAME=mysql

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_mysql_debug_start.log
echo "start!" > $LOG_FILE


docker run -p 3308:3306 -d --cap-add=SYS_PTRACE --name $DOCKER_CON_NAME $DOCKERNAME:$VERSION


