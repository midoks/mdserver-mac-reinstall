#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=gmagick
LIBV=2.0.6RC1

if [ "$VERSION" -lt "70" ];then
	LIBV=1.1.7RC3
fi

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}

LIB_DEPEND_DIR=`brew info graphicsmagick | grep ${BREW_DIR}/Cellar/graphicsmagick | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-gmagick=${LIB_DEPEND_DIR}"

FIND="GraphicsMagick version"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
