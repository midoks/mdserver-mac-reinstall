#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=geoip
LIBV=1.1.1

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}

LIB_DEPEND_DIR=`brew info geoip | grep ${BREW_DIR}/Cellar/geoip | cut -d \  -f 1 | awk 'END {print}'`

CONFIG_OPTION="--with-geoip=$LIB_DEPEND_DIR"

FIND="geoip.custom_directory"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
