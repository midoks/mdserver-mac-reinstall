#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

#(libpng install)
cd $MDIR/source/gd/libpng*
./configure --prefix=$DIR/cmd/libpng
make && make install && make clean


#(freetype install)
cd $MDIR/source/gd/freetype*
./configure --prefix=$DIR/cmd/freetype
make && make install && make clean


#(jpeg install)
cd $MDIR/source/gd/jpeg-7
./configure --prefix=$DIR/cmd/jpeg7 --enable-shared --enable-static
make && make install && make clean

#gd install
cd $MDIR/source/php55/ext/gd
$DIR/php/php55/bin/phpize
./configure \
--with-php-config=$DIR/php/php55/bin/php-config \
--with-zlib-dir=$DIR/cmd/zlib \
--with-png-dir=$DIR/cmd/libpng \
--with-freetype-dir=$DIR/cmd/freetype \
--with-jpeg-dir=$MDIR/cmd/jpeg7
make && make install && make clean
