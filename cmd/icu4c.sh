#! /bin/sh

#添加变量
TMP_DIR=$(cd "$(dirname "$0")"; pwd)
PATH=$PATH:$TMP_DIR/cmd
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

cd $MDIR/source/icu56/source

# ./configure --prefix=$DIR/cmd/icu4c CXXFLAGS="-g -O2 -std=c++11"
# install 
./configure --prefix=/usr/local
make && make install