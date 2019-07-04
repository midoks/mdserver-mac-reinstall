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

sh $B_DIR/cmd_icu.sh

