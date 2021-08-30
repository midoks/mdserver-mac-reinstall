#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=varnish
LIBV=1.2.6


LIB_DEPEND_DIR=`brew info varnish | grep /usr/local/Cellar/varnish | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-varnish=$LIB_DEPEND_DIR"


FIND="varnish.values_memory_size"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND
