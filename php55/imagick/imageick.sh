#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/usr/local/Cellar

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


PATH=$PATH:$DIR/cmd/ImageMagick-6.9.0/include/ImageMagick/wand/


cd $MDIR/source/gd/imageick
#image install
$DIR/php/bin/phpize
export PKG_CONFIG_PATH=$DIR/cmd/ImageMagick-6.9.0/lib/pkgconfig/
./configure \
--with-php-config=$DIR/php/bin/php-config \
--with-imagick=$DIR/cmd/ImageMagick-6.9.0
make && make install && make clean
