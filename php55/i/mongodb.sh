#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:$DIR/cmd/openssl:$DIR/cmd/openssl/include



DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")
#echo $DIR
#echo $(pwd)



cd $MDIR/source/php_ext/mongodb-1.3.4

#./configure --help 
#exit

$DIR/php/php55/bin/phpize
# install
./configure  --enable-mongodb \
--with-php-config=$DIR/php/php55/bin/php-config \
--with-openssl-dir=/usr/local/opt/openssl


make && make install && make clean
