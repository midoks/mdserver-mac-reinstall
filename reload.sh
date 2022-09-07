#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")


VERSION=$1

if [ "$VERSION" == "" ];then
	echo "缺少版本信息"
	exit 0 
fi

if [ ! -f $MDIR/tmp/php$VERSION-fpm.pid ];then
	echo "PHP${VERSION}未启动!"
	exit 0
fi


echo "cd $MDIR/php && ./status.sh $VERSION stopone"
cd $MDIR/php && ./status.sh $VERSION stopone

ps -ef | grep php$VERSION | grep -v grep | awk '{print $2}'|xargs kill

echo "cd $MDIR/php && ./status.sh $VERSION start"
cd $MDIR/php && ./status.sh $VERSION start
echo "cd $MDIR/php && ./status.sh $VERSION start end"
