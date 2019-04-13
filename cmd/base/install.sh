#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


B_DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$B_DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")

mkdir -p $MDIR/source/cmd


if [ ! -f /usr/local/bin/brew ];then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#echo $B_DIR
sh $B_DIR/cmd_libevent.sh
sh $B_DIR/cmd_libmemcached.sh
sh $B_DIR/cmd_zlib.sh
sh $B_DIR/cmd_openssl.sh
sh $B_DIR/cmd_curl.sh
sh $B_DIR/cmd_pcre.sh
sh $B_DIR/cmd_gettext.sh
sh $B_DIR/cmd_libiconv.sh
sh $B_DIR/cmd_mhash.sh
sh $B_DIR/cmd_libpng.sh
sh $B_DIR/cmd_freetype.sh
sh $B_DIR/cmd_libjpeg.sh
sh $B_DIR/cmd_scws.sh
sh $B_DIR/cmd_imagemagick.sh
sh $B_DIR/cmd_icu.sh

