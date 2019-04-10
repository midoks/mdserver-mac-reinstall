#! /bin/sh


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

cd $MDIR/source/php_ext/php_memcached-2.2.0
make clean

$DIR/php/php55/bin/phpize

./configure \
--with-php-config=$DIR/php/php55/bin/php-config \
--with-libmemcached-dir=$DIR/cmd/libmemcached-1.0.4 \
--with-zlib-dir=$DIR/cmd/zlib

make && make install && make clean