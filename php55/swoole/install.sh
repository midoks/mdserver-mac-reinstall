#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

VERSION=$1
LIBNAME=swoole
LIBV='1.10.1'


extFile=$serverPath/php//lib/php/extensions/no-debug-non-zts-20121212/${LIBNAME}.so

echo $DIR
echo $VERSION


#cd $MDIR/source/swoole-1.8.13/
#echo $(pwd)

#swoole install
#$DIR/php/php55/bin/phpize
#./configure --with-php-config=$DIR/php/php55/bin/php-config
#make && make install && make clean
