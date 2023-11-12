#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
PWD_DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


DOCKERNAME=php72
VERSION=1.0.0
DOCKER_CON_NAME=php72


echo '' > $MDIR/bin/logs/reinstall/cmd_docker_dir_docker-php_install.log
echo 'install php72 start'
FIND_DOCKER=`which docker`

if [ "$FIND_DOCKER" == "" ]; then
	echo "please installed docker!"
	exit 0
fi

mkdir -p $MDIR/source
if [ ! -d $MDIR/source/docker-php ]; then
	 cd $MDIR/source && git clone https://github.com/midoks/docker-php
fi

# if [ ! -d $MDIR/source/docker-php ]; then
cd $MDIR/source/docker-php && git pull
# fi



echo "docker build -t $DOCKERNAME:$VERSION ./"
docker build -t $DOCKERNAME:$VERSION ./


echo 'install php72 end'