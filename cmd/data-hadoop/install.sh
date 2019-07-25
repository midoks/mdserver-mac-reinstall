#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
PWD_DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


DOCKERNAME=hadoop
VERSION=v1.0.0
DOCKER_CON_NAME=hadoop_docker


echo '' > $MDIR/bin/logs/reinstall/cmd_data-hadoop_install.log
echo 'install hadoop start'
FIND_DOCKER=`which docker`

if [ "$FIND_DOCKER" == "" ]; then
	echo "please installed docker!"
	exit 0
fi

mkdir -p $MDIR/source/hadoop
if [ ! -f $MDIR/source/hadoop/hadoop-2.8.3.tar.gz ]; then
	wget -O $MDIR/source/hadoop/hadoop-2.8.3.tar.gz http://archive.apache.org/dist/hadoop/common/hadoop-2.8.3/hadoop-2.8.3.tar.gz
fi


if [ ! -f $MDIR/source/hadoop/cdh5.16.2-release.tar.gz ]; then
	wget -O $MDIR/source/hadoop/cdh5.16.2-release.tar.gz https://github.com/cloudera/hue/archive/cdh5.16.2-release.tar.gz
fi


cp $MDIR/source/hadoop/hadoop-2.8.3.tar.gz $PWD_DIR/docker-hadoop/
cp $MDIR/source/hadoop/cdh5.16.2-release.tar.gz $PWD_DIR/docker-hadoop/



echo "docker build ./ -t $DOCKERNAME:$VERSION\r\n"
cd  $MDIR/bin/reinstall/cmd/data-hadoop/docker-hadoop && docker build ./ -t $DOCKERNAME:$VERSION


rm -rf $PWD_DIR/docker-hadoop/hadoop-2.8.3.tar.gz
rm -rf $PWD_DIR/docker-hadoop/cdh5.16.2-release.tar.gz


echo 'install hadoop end'