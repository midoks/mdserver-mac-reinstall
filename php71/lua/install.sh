#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=lua
LIBV=2.0.6

LIB_DEPEND_DIR=`brew info lua | grep /usr/local/Cellar/lua | cut -d \  -f 1 | awk 'END {print}'`

CONFIG_OPTION="--with-lua=$LIB_DEPEND_DIR"
FIND="lua support"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

