#! /bin/sh

#添加变量
TMP_DIR=$(cd "$(dirname "$0")"; pwd)
PATH=$PATH:$TMP_DIR/cmd
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/usr/local/Cellar


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

cd $MDIR/source/cphalcon55/build

$DIR/php/php55/bin/phpize

./install