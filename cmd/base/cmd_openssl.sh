#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=/opt/homebrew/bin:$PATH


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

SYS_ARCH=`arch`

mkdir -p $MDIR/source/cmd




echo "openssl start"

# cd /Applications/mdserver/bin/reinstall/cmd/base && bash cmd_openssl.sh

opensslVersion="1.0.2u"

if [ ! -f $MDIR/source/cmd/openssl-${opensslVersion}.tar.gz ];then
	# wget -O $MDIR/source/cmd/openssl-${opensslVersion}.tar.gz https://www.openssl.org/source/old/1.0.2/openssl-${opensslVersion}.tar.gz
	wget -O $MDIR/source/cmd/openssl-${opensslVersion}.tar.gz https://www.openssl.org/source/openssl-${opensslVersion}.tar.gz
fi

if [ ! -d $DIR/cmd/openssl ];then

	if [ ! -d $MDIR/source/cmd/openssl-${opensslVersion} ];then
		cd $MDIR/source/cmd &&  tar -zxvf openssl-${opensslVersion}.tar.gz
	fi

	cd $MDIR/source/cmd/openssl-${opensslVersion}

	# 也行
	# brew install rbenv/tap/openssl@1.0
	# /opt/homebrew/Library/Taps/rbenv/homebrew-tap
	# https://github.com/rbenv/homebrew-tap/issues/1
	if [ "${SYS_ARCH}" == "arm64" ] ;then
		if [ ! -d ${BREW_DIR}/Cellar/openssl@1.0 ];then
			brew install rbenv/tap/openssl@1.0
		fi
	else
		# mac amd
		./Configure darwin64-x86_64-cc --prefix=$DIR/cmd/openssl shared zlib
		# sed -i "s/darwin-i386-cc/darwin64-x86_64-cc/g" Makefile
		make && make install && make clean
	fi

fi

# if [ -d $MDIR/source/cmd/openssl-${opensslVersion} ];then
# 	rm -rf $MDIR/source/cmd/openssl-${opensslVersion}
# fi


echo "openssl end"

