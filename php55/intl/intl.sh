#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

export DYLID_LIBRARY_PATH=$DIR/cmd/icu4c/lib

#php_zlib install
cd $MDIR/source/php55/ext/intl

make clean

#export LDFLAGS="-L$DIR/cmd/icu4c/lib"
#export CPPFLAGS="-I$DIR/cmd/icu4c/include"


# $DIR/php/php55/bin/phpize
# ./configure --enable-intl \
# --with-php-config=$DIR/php/php55/bin/php-config \
# --with-icu-dir=/usr/local/Cellar/icu4c/54.1
#./configure --help
#exit

$DIR/php/php55/bin/phpize
#/configure --help
./configure --enable-intl \
--with-php-config=$DIR/php/php55/bin/php-config \
--with-icu-dir=/usr/local/lib/icu

make && make install 
#&& make clean
