#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=xdebug
LIBV=3.2.2

if [ "$VERSION" -lt "70" ];then
	LIBV=2.2.7
elif [ "$VERSION" == "74" ];then
	LIBV=2.8.0
elif [ "$VERSION" -lt "74" ];then
	LIBV=2.7.0
fi

CONFIG_OPTION="|"
FIND="xdebug.auto_trace"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

