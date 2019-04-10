#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


cd $MDIR/source/php55/ext/openssl
#openssl install
$DIR/php/php55/bin/phpize
./configure --with-php-config=$DIR/php/php55/bin/php-config \
--with-openssl=/usr/local/opt/openssl
make && make install && make clean
