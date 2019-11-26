#! /bin/sh
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/share/man:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin


DIR=$(cd "$(dirname "$0")"; pwd)
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
DIR=$(dirname "$DIR")
MDIR=$(dirname "$DIR")


sh $MDIR/bin/reinstall/cmd/base/cmd_icu.sh


mkdir -p $MDIR/source
mkdir -p $MDIR/bin/logs/reinstall


echo "" > $MDIR/bin/logs/reinstall/cmd_php-ext-init_install.log

cd $MDIR/bin/reinstall && sh $MDIR/bin/reinstall/install_all_php.sh

