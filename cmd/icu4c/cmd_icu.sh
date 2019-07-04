#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'icu4c start'

if [ ! -f $MDIR/source/cmd/icu4c-4_8_2-src.tgz ];then
	wget -O $MDIR/source/cmd/icu4c-4_8_2-src.tgz https://github.com/unicode-org/icu/releases/download/release-4-8-2/icu4c-4_8_2-src.tgz
fi

if [ ! -d $MDIR/source/cmd/icu ];then
	cd $MDIR/source/cmd &&  tar -zxvf icu4c-4_8_2-src.tgz
fi


if [ ! -d $DIR/cmd/icu ];then

cd $MDIR/source/cmd/icu/source
./configure --prefix=$DIR/cmd/icu CXXFLAGS="-g -O2 -std=c++11" && make && make install

fi
echo 'icu4c end'

