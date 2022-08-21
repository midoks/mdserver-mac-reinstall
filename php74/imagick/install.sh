#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=imagick
LIBV=3.7.0

LIB_DEPEND_DIR=`brew info imagemagick | grep /usr/local/Cellar/imagemagick | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-imagick=${LIB_DEPEND_DIR}"

FIND="imagick.locale_fix"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
