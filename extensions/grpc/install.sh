#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=grpc
LIBV=1.57.0

if [ "$VERSION" -ge "70" ];then
	LIBV=1.59.1
fi


BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}

PHP_EXT_NEED_LIST=(grpc)
for PHP_EXT in ${PHP_EXT_NEED_LIST[@]}; do
	if [ ! -d ${BREW_DIR}/Cellar/${PHP_EXT} ];then
		brew install ${PHP_EXT}
	fi
done

LIB_DEPEND_DIR=`brew info grpc | grep ${BREW_DIR}/Cellar/grpc | cut -d \  -f 1 | awk 'END {print}'`

CONFIG_OPTION="--with-grpc=$LIB_DEPEND_DIR"


FIND="grpc.grpc_trace"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

