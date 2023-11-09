#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=oci8
LIBV=2.0.12

sh $MDIR/bin/reinstall/cmd/base/cmd_oci8.sh

LIB_DEPEND_DIR=`ls /usr/local/Cellar/instantclient | grep instantclient | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-oci8=shared,instantclient,/usr/local/Cellar/instantclient/$LIB_DEPEND_DIR"

FIND="oci8.ping_interval"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

