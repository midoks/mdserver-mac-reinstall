#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=vld
LIBV=0.17.1

CONFIG_OPTION="--enable-vld"
FIND="vld.active"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

