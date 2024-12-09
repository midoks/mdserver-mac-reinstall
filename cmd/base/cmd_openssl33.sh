#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/opt/homebrew/bin

DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd
opensslVersion="3.3.2"
echo 'openssl start'

# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_openssl33.sh

if [ ! -f $MDIR/source/cmd/openssl-${opensslVersion}.tar.gz ];then
	wget -O $MDIR/source/cmd/openssl-${opensslVersion}.tar.gz https://www.openssl.org/source/openssl-${opensslVersion}.tar.gz
fi


if [ ! -d $DIR/cmd/openssl33 ];then
	if [ ! -d $MDIR/source/cmd/openssl-${opensslVersion} ];then
		cd $MDIR/source/cmd &&  tar -zxvf openssl-${opensslVersion}.tar.gz
	fi

	cd $MDIR/source/cmd/openssl-${opensslVersion}
	#sed -i "s/darwin-i386-cc/darwin64-x86_64-cc/g" Makefile
	./config --prefix=$DIR/cmd/openssl33 shared && make && make install && make clean
	# sed -i "s/darwin-i386-cc/darwin64-x86_64-cc/g" Makefile
fi

if [ -d $MDIR/source/cmd/openssl-${opensslVersion} ];then
	rm -rf $MDIR/source/cmd/openssl-${opensslVersion}
fi
echo 'openssl end'

