#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=php71
VERSION=1.0.0
DOCKER_CON_NAME=php71

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_docker_dir_docker-go_uninstall.log
echo "uninstall!" > $LOG_FILE


echo 'ok'