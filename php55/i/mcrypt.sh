#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


#mcrypt
cd $MDIR/source/mcrypt/libmcrypt*
./configure \
--prefix=$DIR/cmd/libmcrypt
make && make install && make clean


#pbp_mcrypt
cd $MDIR/source/php55/ext/mcrypt/
$DIR/php/php55/bin/phpize
./configure --with-php-config=$DIR/php/php55/bin/php-config \
--with-mcrypt=$DIR/cmd/libmcrypt
make && make install && make clean
