#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=swoole
LIBV=5.0.3

if [ "$VERSION" -lt "70" ];then
	LIBV=1.10.1
elif [ "$VERSION" == "70" ];then
	LIBV=4.3.0
elif [ "$VERSION" == "71" ];then
	LIBV=4.5.2
elif [ "$VERSION" == "72" ];then
	LIBV=4.8.10
elif [ "$VERSION" -gt "74" ];then
	LIBV=5.0.3
fi


DEPEND_LIB_NAME=openssl

if [ "$VERSION" -gt "72" ];then
	DEPEND_LIB_NAME=openssl@1.1
fi

if [ "$VERSION" -ge "74" ];then
	DEPEND_LIB_NAME=openssl@3
fi

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}

LIB_DEPEND_DIR=`brew info ${DEPEND_LIB_NAME} | grep ${BREW_DIR}/Cellar/${DEPEND_LIB_NAME} | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--enable-openssl|--with-openssl-dir=${LIB_DEPEND_DIR}|--enable-sockets"

FIND="swoole.display_errors"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

