#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'icu4c start'


if [ ! -d /usr/local/lib/icu/52.2 ];then

	if [ ! -f $MDIR/source/cmd/icu4c-52_2-src.tgz ];then
		wget -O $MDIR/source/cmd/icu4c-52_2-src.tgz https://github.com/unicode-org/icu/releases/download/release-52-2/icu4c-52_2-src.tgz
	fi

	if [ ! -d $MDIR/source/cmd/icu ];then
		cd $MDIR/source/cmd &&  tar -zxvf icu4c-52_2-src.tgz

		cd $MDIR/source/cmd/icu/source
		./runConfigureICU MacOSX  && make  CXXFLAGS="-g -O2 -std=c++11" && make install
	fi	

fi




echo 'icu4c end'

