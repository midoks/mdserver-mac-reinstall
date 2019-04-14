#! /bin/sh

PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'ImageMagick start'

brew install imagemagick

# if [ ! -f $MDIR/source/cmd/ImageMagick-x86_64-apple-darwin17.7.0.tar.gz ];then
# 	wget -O $MDIR/source/cmd/ImageMagick-x86_64-apple-darwin17.7.0.tar.gz https://imagemagick.org/download/binaries/ImageMagick-x86_64-apple-darwin17.7.0.tar.gz
# fi

# if [ ! -d $MDIR/source/cmd/ImageMagick-7.0.8 ];then
# 	cd $MDIR/source/cmd &&  tar -zxvf ImageMagick-x86_64-apple-darwin17.7.0.tar.gz
# fi


# if [ ! -d $DIR/cmd/ImageMagick ];then

# 	mkdir -p $DIR/cmd/ImageMagick
# 	cd $MDIR/source/cmd/ImageMagick-*
# 	cp -rf ./* $DIR/cmd/ImageMagick/
# fi

echo 'ImageMagick end'