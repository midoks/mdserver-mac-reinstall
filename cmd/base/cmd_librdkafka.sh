#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'librdkafka start'

if [ ! -d /usr/local/Cellar/librdkafka ];then
	brew install librdkafka
fi
echo 'librdkafka end'

