#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
LANG="en_US.UTF-8"


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


GO_VERSION=1.3.4


echo '' > $MDIR/bin/logs/reinstall/cmd_other_dir_go-fastdfs_install.log
echo 'install go-fastdfs start'

if [ ! -d /usr/local/Cellar/go ];then
	echo "install golang start"
	brew install go
	echo "install golang end"
fi


mkdir -p $MDIR/source/go-fastdfs

if [ ! -f $MDIR/source/go-fastdfs/v${GO_VERSION}.tar.gz ]; then
	wget -O $MDIR/source/go-fastdfs/v${GO_VERSION}.tar.gz   https://github.com/sjqzhang/go-fastdfs/archive/v${GO_VERSION}.tar.gz
fi

if [ ! -d $MDIR/source/go-fastdfs/go-fastdfs-${GO_VERSION} ]; then
	cd $MDIR/source/go-fastdfs && tar -zxvf $MDIR/source/go-fastdfs/v${GO_VERSION}.tar.gz
fi

if [ ! -f $MDIR/source/go-fastdfs/go-fastdfs-${GO_VERSION}/fileserver ];then
	
	cd $MDIR/source/go-fastdfs/go-fastdfs-${GO_VERSION}

	if [ -d $MDIR/source/go-fastdfs/go-fastdfs-${GO_VERSION}/vendor ];then
		 mv vendor src
	fi
	pwd=`pwd`
	echo "$pwd go build -o fileserver fileserver.go"
	GOPATH=$pwd go build -o fileserver fileserver.go
fi

cd $MDIR/source/go-fastdfs/go-fastdfs-${GO_VERSION}


if [ ! -d $MDIR/source/go-fastdfs/demo ];then
	mkdir -p $MDIR/source/go-fastdfs/demo
	mv fileserver $MDIR/source/go-fastdfs/demo
	chmod +x $MDIR/source/go-fastdfs/demo/fileserver
fi


echo 'install go-fastdfs end'