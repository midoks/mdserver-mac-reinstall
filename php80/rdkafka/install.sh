#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=rdkafka
LIBV=3.0.5

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}
LIB_DEPEND_DIR=`brew info librdkafka | grep ${BREW_DIR}/Cellar/librdkafka | cut -d \  -f 1 | awk 'END {print}'`

CONFIG_OPTION="--with-rdkafka=${LIB_DEPEND_DIR}"
FIND="rdkafka support"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
