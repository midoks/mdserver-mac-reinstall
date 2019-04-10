#! /bin/sh


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

cd $MDIR/source/php_ext/memcache-2.2.7
make clean

$DIR/php/php55/bin/phpize

./configure \
--with-php-config=$DIR/php/php55/bin/php-config \
--with-zlib-dir=$DIR/cmd/zlib

make && make install && make clean