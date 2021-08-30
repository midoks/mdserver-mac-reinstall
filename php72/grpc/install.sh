#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=grpc
LIBV=1.39.0

PHP_EXT_NEED_LIST=(grpc)
for PHP_EXT in ${PHP_EXT_NEED_LIST[@]}; do
	if [ ! -d /usr/local/Cellar/${PHP_EXT} ];then
		brew install ${PHP_EXT}
	fi
done

LIB_DEPEND_DIR=`brew info grpc | grep /usr/local/Cellar/grpc | cut -d \  -f 1 | awk 'END {print}'`

CONFIG_OPTION="--with-grpc=$LIB_DEPEND_DIR"


FIND="grpc.grpc_trace"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

