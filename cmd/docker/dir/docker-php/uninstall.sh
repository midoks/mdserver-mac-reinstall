#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

DOCKERNAME=php72
VERSION=1.0.0
DOCKER_CON_NAME=php72

LOG_FILE=$MDIR/bin/logs/reinstall/cmd_docker_dir_docker-php_uninstall.log
echo "uninstall!" > $LOG_FILE


echo 'ok'