#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/usr/local/Cellar
export PATH=$PATH:/opt/homebrew/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=amqp
LIBV=1.8.0


if [ ! -d /usr/local/Cellar/rabbitmq-c ];then
	brew install rabbitmq-c
fi

BREW_DIR=`which brew`
BREW_DIR=${BREW_DIR/\/bin\/brew/}
LIB_DEPEND_DIR=`brew info rabbitmq-c | grep ${BREW_DIR}/Cellar/rabbitmq-c | cut -d \  -f 1 | awk 'END {print}'`
CONFIG_OPTION="--with-amqp|--with-librabbitmq-dir=${LIB_DEPEND_DIR}"

sh $MDIR/bin/reinstall/ext_shell/install.sh $VERSION $LIBNAME $LIBV $CONFIG_OPTION

