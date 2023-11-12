#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=solr
LIBV=2.6.0

if [ "$VERSION" -lt "70" ];then
	LIBV=2.4.0
elif [ "$VERSION" -lt "82" ];then
	LIBV=2.5.1
fi


BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}

LIB_DEPEND_DIR=`brew info curl | grep ${BREW_DIR}/Cellar/curl | cut -d \  -f 1 | awk 'END {print}'`


CONFIG_OPTION="--with-curl=$LIB_DEPEND_DIR"
FIND="Solr Support"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

