#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")
#echo $DIR
#echo $(pwd)


#1. curl install
# cd $MDIR/source/curl
# ./configure --prefix=$DIR/cmd/curl --with-ssl=$DIR/cmd/openssl
# make && make install && make clean

#2.php_curl install (ok)
cd $MDIR/source/php55/ext/curl
$DIR/php/php55/bin/phpize
./configure --with-curl=$DIR/cmd/curl --with-php-config=$DIR/php/php55/bin/php-config 
make  && make install && make clean