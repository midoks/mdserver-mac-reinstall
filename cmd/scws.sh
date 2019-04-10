#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

#PATH=PATH:$DIR/php/bin

echo $MDIR

cd $MDIR/source/php_ext/scws


#scws install
./configure --prefix=$MDIR/bin/cmd/scws 

make && make install && make clean
