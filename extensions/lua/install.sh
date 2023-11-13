#! /bin/sh
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=lua
LIBV=2.0.7

if [ "$VERSION" -lt "74" ];then
	LIBV=2.0.6
fi


BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}
LIB_DEPEND_DIR=`brew info lua | grep ${BREW_DIR}/Cellar/lua | cut -d \  -f 1 | awk 'END {print}'`
# echo $LIB_DEPEND_DIR

#复制lua.h到include,好识别
if [ ! -f ${LIB_DEPEND_DIR}/include/lua.h ];then
	cp -rf ${LIB_DEPEND_DIR}/include/lua/lua.h ${LIB_DEPEND_DIR}/include/lua.h
fi

export LDFLAGS="-L${LIB_DEPEND_DIR}/lib"
export CPPFLAGS="-I${LIB_DEPEND_DIR}/include/lua"
export PKG_CONFIG_PATH="${LIB_DEPEND_DIR}/lib/pkgconfig"

CONFIG_OPTION="--with-lua=$LIB_DEPEND_DIR"
FIND="lua support"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

