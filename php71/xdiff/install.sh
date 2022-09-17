#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=xdiff
LIBV=2.1.1


LIB_DEPEND_DIR=`brew info libxdiff | grep /usr/local/Cellar/libxdiff | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-xdiff=$LIB_DEPEND_DIR"

FIND="libxdiff version"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
