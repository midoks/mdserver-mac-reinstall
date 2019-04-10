#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

#echo $DIR (zlib install)
cd $MDIR/source/Mosquitto-PHP-master
# ./configure --prefix=$DIR/cmd/zlib
# make && make install && make clean

#echo $(pwd)

#php_zlib install

make clean

$DIR/php/php55/bin/phpize
./configure \
--with-php-config=$DIR/php/php55/bin/php-config
make && make install && make clean
