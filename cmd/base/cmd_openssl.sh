#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd

echo 'openssl start'

if [ ! -f $MDIR/source/cmd/openssl-1.0.2n.tar.gz ];then
	wget -O $MDIR/source/cmd/openssl-1.0.2n.tar.gz https://www.openssl.org/source/openssl-1.0.2n.tar.gz
fi

if [ ! -d $MDIR/source/cmd/openssl-1.0.2n ];then
	cd $MDIR/source/cmd &&  tar -zxvf openssl-1.0.2n.tar.gz
fi


if [ ! -d $DIR/cmd/openssl ];then

cd $MDIR/source/cmd/openssl-1.0.2n
./Configure darwin64-x86_64-cc --prefix=$DIR/cmd/openssl no-shared  && make && make install && make clean
#sed -i "s/darwin-i386-cc/darwin64-x86_64-cc/g" Makefile
fi
echo 'openssl end'

