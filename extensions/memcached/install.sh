#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=memcached
LIBV=3.2.0

if [ "$VERSION" -lt "70" ];then
	LIBV=2.2.0
fi


CONFIG_OPTION="--with-libmemcached-dir=$DIR/cmd/libmemcached|--with-zlib-dir=$DIR/cmd/zlib"
FIND="memcached.compression_factor"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
