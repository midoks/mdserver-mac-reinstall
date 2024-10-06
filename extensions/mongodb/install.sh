#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=mongodb
LIBV=1.20.0

if [ "$VERSION" == '80' ];then
	LIBV=1.9.0
elif [ "$VERSION" == '74' ];then
	LIBV=1.7.4
elif [ "$VERSION" == '71' ];then
	LIBV=1.7.4
elif [ "$VERSION" == '70' ];then
	LIBV=1.7.4
elif [ "$VERSION" == '56' ];then
	LIBV=1.7.4
elif [ "$VERSION" == '55' ];then
	LIBV=1.5.3
fi


CONFIG_OPTION="|"

FIND="mongodb.debug"
sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION $FIND

