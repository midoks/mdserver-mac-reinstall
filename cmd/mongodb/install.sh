#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


mkdir -p $MDIR/source/mongodb

echo "install mongodb start"
VERSION=4.2.6

if [ ! -f $MDIR/source/mongodb/mongodb-macos-x86_64-${VERSION}.tgz ];then
	wget -O $MDIR/source/mongodb/mongodb-macos-x86_64-${VERSION}.tgz http://fastdl.mongodb.org/osx/mongodb-macos-x86_64-${VERSION}.tgz
fi

if [ ! -d $MDIR/source/mongodb/mongodb-macos-x86_64-${VERSION} ];then
	cd $MDIR/source/mongodb && tar zxvf $MDIR/source/mongodb/mongodb-macos-x86_64-${VERSION}.tgz
fi

if [ ! -d $DIR/mongodb ];then

	cd $MDIR/source/mongodb/mongodb-macos-x86_64-${VERSION}

	mkdir -p $DIR/mongodb
	cp -r $MDIR/source/mongodb/mongodb-macos-x86_64-${VERSION}/ $DIR/mongodb/
	mkdir -p $DIR/mongodb/data
	mkdir -p $DIR/mongodb/logs

	if [ ! -f $DIR/mongodb/mongodb.conf ];then
		cp $MDIR/bin/reinstall/tpl/mongodb/mongodb.conf $DIR/mongodb/

		sed -i '_bak' "s#{PATH}#${DIR}#g" $DIR/mongodb/mongodb.conf
		rm -rf $DIR/mongodb/mongodb.conf_bak
	fi
fi

echo "install mongodb end"
