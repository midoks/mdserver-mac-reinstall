#! /bin/sh

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

DIR=$(cd "$(dirname "$0")"; pwd)
MDIR=$(dirname "$DIR")




# php53 start #
cd $DIR/cmd/php53 && sh install.sh
cd $DIR/cmd/php53/gd && sh install.sh
# php53 start #






