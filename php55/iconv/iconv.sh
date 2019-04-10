#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

#echo $DIR
#echo $(pwd)

cd $MDIR/source/iconv/libiconv*
./configure \
--prefix=$DIR/cmd/libiconv
make && make install && make clean


#iconv install
cd $MDIR/source/php55/ext/iconv
$DIR/php/php55/bin/phpize
./configure --with-php-config=$DIR/php/php55/bin/php-config \
--with-iconv-dir=$DIR/cmd/libiconv
make && make install && make clean