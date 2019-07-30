#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
LANG="en_US.UTF-8"


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


echo '' > $MDIR/bin/logs/reinstall/cmd_go-fastdfs_install.log
echo 'install go-fastdfs start'

mkdir -p $MDIR/source/go-fastdfs

if [ ! -f $MDIR/source/go-fastdfs/v1.3.1.tar.gz ]; then
	wget -O $MDIR/source/go-fastdfs/v1.3.1.tar.gz   https://github.com/sjqzhang/go-fastdfs/archive/v1.3.1.tar.gz
fi

if [ ! -d $MDIR/source/go-fastdfs/go-fastdfs-1.3.1 ]; then
	cd $MDIR/source/go-fastdfs && tar -zxvf $MDIR/source/go-fastdfs/v1.3.1.tar.gz
fi

if [ ! -f $MDIR/source/go-fastdfs/go-fastdfs-1.3.1/fileserver ];then
	cd $MDIR/source/go-fastdfs/go-fastdfs-1.3.1

	if [ -d $MDIR/source/go-fastdfs/go-fastdfs-1.3.1/vendor ];then
		 mv vendor src
	fi
	pwd=`pwd`
	GOPATH=$pwd go build -o fileserver fileserver.go
fi

cd $MDIR/source/go-fastdfs/go-fastdfs-1.3.1

if [ ! -d $MDIR/source/go-fastdfs/demo ];then
	mkdir -p $MDIR/source/go-fastdfs/demo
	mv fileserver $MDIR/source/go-fastdfs/demo
	chmod +x $MDIR/source/go-fastdfs/demo/fileserver
fi

cd $MDIR/source/go-fastdfs/demo/ && ./fileserver




echo 'install go-fastdfs end'