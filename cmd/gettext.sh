#! /bin/sh

#添加变量
TMP_DIR=$(cd "$(dirname "$0")"; pwd)
PATH=$PATH:$TMP_DIR/cmd
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

cd $MDIR/source/gettext*


# install 
./configure --prefix=$DIR/cmd/gettext

make && make install && make clean