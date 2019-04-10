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

cd $MDIR/source/openssl-1.0.2n

#./config --prefix=$DIR/cmd/openssl darwin64-x86_64-cc

# install 
./Configure darwin64-x86_64-cc --prefix=$DIR/cmd/openssl
#sed -i "s/darwin-i386-cc/darwin64-x86_64-cc/g" Makefile
make && make install && make clean

# sudo ln -s $DIR/cmd/openssl /usr/bin/openssl