#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/usr/local/Cellar


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


# cd $MDIR/source/php55/ext/intl
# #intl install
# $DIR/php/php55/bin/phpize
# ./configure --with-php-config=$DIR/php/php55/bin/php-config \
# --with-icu-dir=/usr/local/Cellar/icu4c/54.1 \
# --enable-intl
# make && make install && make clean


cd $MDIR/source/php55/ext/gettext
#gettext install
$DIR/php/php55/bin/phpize
./configure --with-php-config=$DIR/php/php55/bin/php-config \
--with-gettext=$MDIR/cmd/gettext
make && make install #&& make clean
