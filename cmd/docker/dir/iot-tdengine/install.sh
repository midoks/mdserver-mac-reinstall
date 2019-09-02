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


DOCKERNAME=tdengine
VERSION=v1.0.0
DOCKER_CON_NAME=tdengine


echo '' > $MDIR/bin/logs/reinstall/cmd_docker_dir_iot-tdengine_install.log
echo 'install tdengine start'
FIND_DOCKER=`which docker`

if [ "$FIND_DOCKER" == "" ]; then
	echo "please installed docker!"
	exit 0
fi

echo "docker build ./ -t $DOCKERNAME:$VERSION\r\n"
cd  $MDIR/bin/reinstall/cmd/docker/dir/iot-tdengine/docker-tdengine \
&& docker build ./ -t $DOCKERNAME:$VERSION


echo 'install tdengine end'


