#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=yaml
LIBV=2.2.3

if [ "$VERSION" -lt '71' ];then
	LIBV=2.1.0
fi

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}
LIB_DEPEND_DIR=`brew info libyaml | grep ${BREW_DIR}/Cellar/libyaml | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-yaml=${LIB_DEPEND_DIR}"

FIND="yaml.decode_binary"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
