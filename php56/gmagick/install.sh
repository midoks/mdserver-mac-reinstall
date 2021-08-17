#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=gmagick
LIBV=1.1.7RC3


LIB_DEPEND_DIR=`brew info graphicsmagick | grep /usr/local/Cellar/graphicsmagick | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-gmagick=${LIB_DEPEND_DIR}"

FIND="GraphicsMagick version"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
