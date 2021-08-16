#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=couchbase
LIBV=2.6.2

LIB_DEPEND_DIR=`brew info libcouchbase | grep /usr/local/Cellar/libcouchbase | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-couchbase=$LIB_DEPEND_DIR"


FIND="couchbase.decoder.json_arrays"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
