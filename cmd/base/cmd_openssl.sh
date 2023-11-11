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




echo 'openssl start'

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

	if [ "${SYS_ARCH}" == "arm64" ] ;then

		echo "use [ brew install rbenv/tap/openssl@1.0 ]"
		exit 0

		BREW_DIR=`which brew`
		BREW_DIR=${BREW_DIR/\/bin\/brew/}

		binutils_DEPEND_DIR=`brew info binutils | grep ${BREW_DIR}/Cellar/binutils | cut -d \  -f 1 | awk 'END {print}'`
		

		if [ "$binutils_DEPEND_DIR" == "" ];then
			echo "macosx arm64 need gcc ranlib!!!, you need [brew install binutils]"
		fi

		brew_ranlib="$binutils_DEPEND_DIR/bin/ranlib"
		brew_ar="$binutils_DEPEND_DIR/bin/ar"
		# echo ${me_ranlib///\\//g}
		echo $brew_ranlib


		# mac arm64
		# no-asm
		export KERNEL_BITS=64
		# ./config darwin64-arm64-cc --prefix=$DIR/cmd/openssl  --openssldir=$DIR/cmd/openssl/ssl  shared zlib
		# ./config --prefix=/Applications/mdserver/bin/reinstall/cmd/openssl --openssldir=/opt/homebrew/opt/libressl  shared 
		# sed -i "" "s/darwin-i386-cc/darwin64-arm64-cc/g" Makefile
		# sed -i "" "s/\/usr\/local\/ssl/\/opt\/homebrew\/opt\/libressl/g" Makefile
		# sed -i "" "s#/usr/bin/ranlib#${brew_ranlib}#g" Makefile
		# sed -i "" "s#AR=\ ar#AR=\ ${brew_ar}#g" Makefile

		# ./Configure darwin64-arm64-cc --prefix=/Applications/mdserver/bin/reinstall/cmd/openssl --openssldir=/opt/homebrew/opt/libressl  shared 
	
		
		# cd $MDIR/source/cmd/openssl-${opensslVersion} && sed -i "" "s/\x86\_64/arm64/g" Configure
		perl ./Configure  darwin64-arm64-cc --prefix=/Applications/mdserver/bin/reinstall/cmd/openssl --openssldir=/Applications/mdserver/bin/reinstall/cmd/openssl/etc no-ssl2 no-ssl3 no-zlib shared enable-cms darwin64-arm6
		# sed -i "" "s#/usr/bin/ranlib#${brew_ranlib}#g" Makefile
		# make -j8 && make install && make clean
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


echo 'openssl end'

