#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
PWD_DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


DOCKERNAME=drone
VERSION=1.0.0
DOCKER_CON_NAME=drone


echo '' > $MDIR/bin/logs/reinstall/cmd_docker_dir_docker-drone_install.log
echo 'install drone start'
FIND_DOCKER=`which docker`

if [ "$FIND_DOCKER" == "" ]; then
	echo "please installed docker!"
	exit 0
fi

mkdir -p $MDIR/source
if [ ! -d $MDIR/source/gogs-drone-docker ]; then
	 cd $MDIR/source && git clone https://github.com/alicfeng/gogs-drone-docker.git
fi

if [ -d $MDIR/source/gogs-drone-docker ]; then
cd $MDIR/source/gogs-drone-docker && git pull && docker-compose up -d
fi



# echo "docker build -t $DOCKERNAME:$VERSION ./"
# docker build -t $DOCKERNAME:$VERSION ./


echo 'install drone end'