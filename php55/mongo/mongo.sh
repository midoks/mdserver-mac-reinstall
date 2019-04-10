#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:$DIR/cmd/openssl:$DIR/cmd/openssl/include



DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")
#echo $DIR
#echo $(pwd)

cd $MDIR/source/php_ext/mongo-1.6.14
make clean

$DIR/php/php55/bin/phpize

./configure \
--with-php-config=$DIR/php/php55/bin/php-config

make && make install && make clean