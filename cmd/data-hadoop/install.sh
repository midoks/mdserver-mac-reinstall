#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

echo '' > $MDIR/bin/logs/reinstall/cmd_data-hadoop_install.log
echo 'install hadoop start'
FIND_DOCKER=`which docker`

if [ "$FIND_DOCKER" == "" ]; then
	echo "please installed docker!"
	exit 0
fi

cd  $MDIR/bin/reinstall/cmd/data-hadoop/docker-hadoop && docker build ./



echo 'install hadoop end'