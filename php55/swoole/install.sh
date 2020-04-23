#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=swoole
LIBV=1.10.1


LIB_DEPEND_DIR=`brew info openssl | grep /usr/local/Cellar/openssl | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--enable-openssl|--with-openssl-dir=${LIB_DEPEND_DIR}|--enable-sockets"

sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION

